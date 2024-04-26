import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:flutter_application_2/application/home/widgets/app_bar_widget.dart';
import 'package:flutter_application_2/utils/functions.dart';

class Stateformtwo extends StatefulWidget {
  bool thereInjuries;
  bool validInsurance;
  String num;
  String carFormNumber;
  String insuranceNumber;
  String carPlateNumber;
  String carPlateNumber2;
  String carCompany;
  String carModel;
  String lat;
  String long;
  var image;
  File file;
  String sen;

  Stateformtwo(
      {required this.thereInjuries,
      required this.validInsurance,
      required this.num,
      required this.carCompany,
      required this.carFormNumber,
      required this.carModel,
      required this.carPlateNumber,
      required this.carPlateNumber2,
      required this.insuranceNumber,
      required this.lat,
      required this.long,
      required this.file,
      required this.image,
      required this.sen});

  @override
  State<Stateformtwo> createState() => _StateformtwoState();
}

String? qus;
TextEditingController areas = TextEditingController();

class _StateformtwoState extends State<Stateformtwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          leading: GestureDetector(
            child: const Icon(
              Icons.menu,
              color: Colors.green,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.green,
                    ),
                    Text(
                      'عربي',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                onTap: () {},
              ),
            ),
          ],
          backgroundColor: Colors.grey.withOpacity(0.5),
        ),
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: [
          Center(
            child: Text(
              "Statment form",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Locate the damage area :",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/car.png"),
                  fit: BoxFit.cover),
            ),
            width: 200,
            height: 300,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Type the areas",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: areas,
              enabled: true,
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Colors.black)),
                hintStyle: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
              ),
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              cursorColor: Colors.black,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Radio(
                activeColor: Colors.green,
                value: "yes",
                groupValue: qus,
                onChanged: (val) {
                  setState(() {
                    qus = val;
                  });
                }),
            Column(
              children: [
                Text(
                  "i confirm that all the information i have provided in ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Text(
                  "this application is correct i bear full responsibility",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Text(
                  "for what results from that",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ],
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              Functions.showDialogFunction(
                context: context,
                data: 'Are you sure to submit the report?',
                onTapYes: () async {
                  var ref1 = await FirebaseStorage.instance
                      .ref('images')
                      .child(basename(widget.file.path));

                  var ref2 = await FirebaseStorage.instance
                      .ref('images')
                      .child(basename(widget.image.path));
                  await ref1.putFile(widget.file);
                  await ref2.putFile(widget.image);

                  var videourl = await ref1.getDownloadURL().then((value) {
                    print('hhhhhhhhhhhhhhhhhhhhh');
                  });
                  var imageurl = await ref2.getDownloadURL().then((value) {
                    print('ggggggggggggggggggggg');
                  });

                  await FirebaseFirestore.instance.collection('reports').add({
                    "carCompany": widget.carCompany,
                    "carFormNumber": widget.carFormNumber,
                    "carModel": widget.carModel,
                    "carPlateNumber": widget.carPlateNumber,
                    "carPlateNumber2": widget.carPlateNumber2,
                    "insuranceNumber": widget.insuranceNumber,
                    "sen": widget.sen,
                    "num": widget.num,
                    "lat": widget.lat,
                    "long": widget.long,
                    "thereInjuries": widget.thereInjuries,
                    "validInsurance": widget.validInsurance,
                    "imageurl": imageurl,
                    "vidurl": videourl
                  }).then((value) {
                    print('dddddddddddddddddddddddddd');
                  });
                  // Navigator.of(context, rootNavigator: true).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => Submitpage(),
                  //   ),
                  // );
                },
              );
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blueGrey),
            ),
          )
        ]))));
  }
}
