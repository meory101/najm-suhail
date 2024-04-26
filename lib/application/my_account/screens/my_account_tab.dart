import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main.dart';

import '../../../utils/functions.dart';
import '../../authentication/screens/login_screen.dart';

class MyAccountTab extends StatefulWidget {
  const MyAccountTab({super.key});

  @override
  State<MyAccountTab> createState() => _MyAccountTabState();
}

class _MyAccountTabState extends State<MyAccountTab> {
  @override
  void initState() {
    getInfo();
    print(prefs!.getString('id'));
    super.initState();
  }

  var data;
  getInfo() async {
    data = await FirebaseFirestore.instance
        .collection('users')
        .doc(prefs!.getString('id'))
        .get();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: data == null
          ? Text('f')
          : Column(
              children: [
                Container(
                  width: 75.0,
                  height: 75.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0.0, 0.3),
                        blurRadius: 0.3,
                        spreadRadius: 0.3,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 75.0,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.edit_note,
                      size: 30.0,
                      color: Colors.green,
                    ),
                    Text(
                      '${data.data()['name']}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'National id: ',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        '${data.data()['national id']}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'E-mail: ',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        '${data.data()['email']}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Password: ',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        '${data.data()['password']}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Phone number: ',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        '${data.data()['phonenum']}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Birth date: ',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        '${data.data()['birthday ']}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'Gender: ',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        '${data.data()['gender ']}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 25.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Text(
                        'City: ',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        '${data.data()['city']}',
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 125.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 25.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(25.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.6),
                          offset: const Offset(0.0, 1.0),
                          blurRadius: 0.5,
                          spreadRadius: 0.5,
                        ),
                      ],
                    ),
                    child: const Text(
                      'Edit',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        prefs!.clear();

                        Functions.showDialogFunction(
                          context: context,
                          data: 'Are you sure to logout?',
                          onTapYes: () {
                            Navigator.of(context, rootNavigator: true)
                                .pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                    (route) => false);
                          },
                        );
                      },
                      child: Container(
                        width: 125.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.red.shade200,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.red.shade200.withOpacity(0.6),
                              offset: const Offset(0.0, 1.0),
                              blurRadius: 0.5,
                              spreadRadius: 0.5,
                            ),
                          ],
                        ),
                        child: const Text(
                          'Logout',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
