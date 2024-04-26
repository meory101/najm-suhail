import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/Report%20Accident%20pages/mapscreen.dart';
import 'package:flutter_application_2/application/Report%20Accident%20pages/statmentform.dart';
import 'package:flutter_application_2/application/home/widgets/app_bar_widget.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/utils/functions.dart';

class viechalinformation extends StatefulWidget {
  bool thereInjuries;
  bool validInsurance;
  String num;
  viechalinformation(
      {required this.thereInjuries,
      required this.validInsurance,
      required this.num});
  @override
  State<viechalinformation> createState() => _viechalinformationState();
}

class _viechalinformationState extends State<viechalinformation> {
  TextEditingController? carformnumber = TextEditingController();
  TextEditingController? insurancecompany = TextEditingController();
  TextEditingController? carplatenumber = TextEditingController();
  TextEditingController? carplatenumberoftheotherpart = TextEditingController();
  TextEditingController? carcompany = TextEditingController();
  TextEditingController? carmodel = TextEditingController();
  final GlobalKey<FormState> fkey = GlobalKey();
  void initState() {
    getInfo();
    print(prefs!.getString('id'));
    super.initState();
  }

  var data;
  var lat;
  var long;
  getInfo() async {
    data = await FirebaseFirestore.instance
        .collection('report')
        .doc(prefs!.getString('id'))
        .get();

    setState(() {});
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
        title: const Text(
          'Primary Question',
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
            child: Form(
          key: fkey,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "please enter vehichle information",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  'car form number',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: carformnumber,
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Insurance company',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: insurancecompany,
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  'car plate number',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: carplatenumber,
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  'car plate number of the other party',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  'car company',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: carcompany,
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
                SizedBox(
                  height: 10,
                ),
                Text(
                  'car model',
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: carmodel,
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
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Share the accident location",
                  style: TextStyle(fontSize: 20, color: Colors.green),
                ),
                Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    child: InkWell(
                      onTap: () async {
                        var latlong = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Mapscreen(),
                            ));
                        if (latlong != null) {
                          lat = latlong.split('/')[0];
                          long = latlong.split('/')[1];
                        }
                      },
                      child: Image.asset("assets/images/map.png"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (/*fkey.currentState!.validate() && lat != null*/true) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Statmentform(
                              num: widget.num,
                              thereInjuries: widget.thereInjuries,
                              validInsurance: widget.validInsurance,
                              carCompany: carcompany!.text,
                              carFormNumber: carformnumber!.text,
                              carModel: carmodel!.text,
                              carPlateNumber2:
                                  carplatenumberoftheotherpart!.text,
                              carPlateNumber: carplatenumber!.text,
                              insuranceNumber: insurancecompany!.text,
                              lat: lat,
                              long: long,
                            ),
                          ));
                    } else {
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
              ])
            ],
          ),
        )),
      ),
    );
  }
}
