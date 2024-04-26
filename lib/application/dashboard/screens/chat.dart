import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';

class Chat extends StatefulWidget {
  String admnID;

  Chat({super.key, required this.admnID});
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var messages;
  getMessages() async {
    messages = FirebaseFirestore.instance.collection('message').snapshots();
    setState(() {});
  }

  @override
  void initState() {
    getMessages();
    super.initState();
  }

  String? currentUserID = prefs!.getString('id');
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () async {
                  // showAdaptiveDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         backgroundColor: Colors.transparent,
                  //         title: Center(
                  //           child: SizedBox(
                  //             height: 20,
                  //             width: 20,
                  //             child: CircularProgressIndicator(
                  //                 color: Colors.green),
                  //           ),
                  //         ),
                  //       );
                  //     });
                  await FirebaseFirestore.instance.collection('message').add({
                    'content': message.text,
                    'date': '',
                    'recieverid': widget.admnID,
                    'senderid': currentUserID,
                  }).then((value) {
                    Navigator.of(context).pop();
                    message.clear();
                    setState(() {});
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: const Icon(
                    Icons.send_rounded,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 7,
            ),
            Expanded(
              flex: 4,
              child: TextFormField(
                controller: message,
              ),
            )
          ],
        ),
      ),
      body: StreamBuilder(
        stream: messages,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Container(
                  padding: EdgeInsets.only(bottom: 100),
                  child: ListView.builder(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      return Container(
                          width: double.infinity,
                          child: snapshot.data.docs[index].data()['senderid'] ==
                                  currentUserID
                              ? ChatBubble(
                                  backGroundColor: Colors.green,
                                  clipper: ChatBubbleClipper2(
                                      type: BubbleType.sendBubble),
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(top: 20),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.5,
                                    ),
                                    child: Text(
                                      snapshot.data.docs[index]
                                          .data()['content'],
                                    ),
                                  ),
                                )
                              : ChatBubble(
                                  clipper: ChatBubbleClipper1(
                                      type: BubbleType.receiverBubble),
                                  alignment: Alignment.topLeft,
                                  margin: EdgeInsets.only(top: 20),
                                  backGroundColor:
                                      const Color.fromARGB(255, 192, 191, 191),
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.5,
                                    ),
                                    child: Text(
                                      snapshot.data.docs[index]
                                          .data()['content'],
                                    ),
                                  ),
                                ));
                    },
                  ),
                )
              : const Text('');
        },
      ),
    );
  }
}
