import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/Report%20Accident%20pages/State2form.dart';
import 'package:flutter_application_2/application/home/widgets/app_bar_widget.dart';
import 'package:flutter_application_2/utils/functions.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Statmentform extends StatefulWidget {
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

  Statmentform(
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
      required this.long});

  @override
  State<Statmentform> createState() => _StatmentformState();
}

class _StatmentformState extends State<Statmentform> {
  File? file;
  var image;
  TextEditingController scenario = TextEditingController();

  getimage() async {
    image = await ImagePicker.platform
        .pickImage(source: ImageSource.camera);
    if (image != null) {
      file = File(image.path);
      setState(() {});
    }
  }

  getvideo() async {
    final picker = ImagePicker();
    XFile? videofile;
    try {
      await picker.pickVideo(source: ImageSource.camera);
      return videofile!.path;
    } catch (e) {
      print("Error picking video :$e");
    }
  }

  void _pickedvideo() async {
    var videoURL = getvideo();
    void initvp() {
      var controller = VideoPlayerController.file(File(videoURL!))
        ..initialize().then((value) => {setState(() {})});
    }
  }

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
          Container(
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                getimage();
              },
              child: TextFormField(
                controller: TextEditingController(
                  text: "Insert photo",
                ),
                enabled: false,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.photo_size_select_actual_outlined,
                    size: 30,
                  ),
                  suffixIconColor: Colors.grey,
                  enabled: false,
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(75),
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black)),
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
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () async {
                _pickedvideo();
              },
              child: TextFormField(
                controller: TextEditingController(
                  text: "Insert video",
                ),
                enabled: false,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.videocam,
                    size: 40,
                  ),
                  suffixIconColor: Colors.grey,
                  enabled: false,
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(75),
                      borderSide: BorderSide(color: Colors.black)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Colors.black)),
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
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Accident scenario:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        offset: const Offset(0.0, 0.3),
                        blurRadius: 0.5,
                        spreadRadius: 0.3,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: scenario ,
                    // enabled: true,
                    // decoration: InputDecoration(
                    //   disabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(50),
                    //       borderSide: BorderSide(color: Colors.black)),
                    //   enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(50),
                    //       borderSide: BorderSide(color: Colors.black)),
                    //   hintStyle: TextStyle(
                    //     fontSize: 14.0,
                    //     color: Colors.black,
                    //   ),
                    //   border: OutlineInputBorder(
                    //       borderSide: BorderSide.none,
                    //       borderRadius: BorderRadius.all(Radius.circular(50))),
                    //   contentPadding:
                    //       EdgeInsets.symmetric(vertical: 0.5, horizontal: 10.0),
                    // ),
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  if(image!=null && file!=null){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Stateformtwo(
                            carCompany: widget.carCompany,
                            carFormNumber: widget.carFormNumber,
                            carModel: widget.carModel,
                            carPlateNumber2: widget.carPlateNumber2,
                            carPlateNumber: widget.carPlateNumber ,
                            file: file!,
                            image: file!,
                            insuranceNumber: widget.insuranceNumber,
                            lat: widget.lat,
                            long: widget.long,
                            num: widget.num,
                            thereInjuries: widget.thereInjuries,
                            validInsurance: widget.validInsurance, 
                            sen :scenario.text
                          ),
                        ));
                  }
                  else{
                     Functions.showDialogFunction(
                      context: context,
                      data: 'All fields required and must be validate',
                      onTapYes: () {},
                    );
                  }
               
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Next"),
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blueGrey),
                ),
              )
            ],
          ),
        ]))));
  }
}
