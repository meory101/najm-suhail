import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/application/Report%20Accident%20pages/viechalinfo.dart';
import 'package:flutter_application_2/application/home/widgets/app_bar_widget.dart';

class firstreportpage extends StatefulWidget {
  const firstreportpage({super.key});

  @override
  State<firstreportpage> createState() => _firstreportpageState();
}

class _firstreportpageState extends State<firstreportpage> {
  String? qus = "no";
  String? qus1 = "no";

  TextEditingController num = TextEditingController();

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
            child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Are there any injuries in the accident",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Radio(
                    activeColor: Colors.green,
                    value: "yes",
                    groupValue: qus,
                    onChanged: (val) {
                      setState(() {
                        qus = val;
                      });
                    }),
                Text("Yes"),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Radio(
                    activeColor: Colors.green,
                    value: "no",
                    groupValue: qus,
                    onChanged: (val) {
                      setState(() {
                        qus = val;
                      });
                    }),
                Text("No"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Do you have valid insurance?",
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Radio(
                    activeColor: Colors.green,
                    value: "y",
                    groupValue: qus1,
                    onChanged: (val) {
                      setState(() {
                        qus1 = val;
                      });
                    }),
                Text("Yes"),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Radio(
                    activeColor: Colors.green,
                    value: "n",
                    groupValue: qus1,
                    onChanged: (val) {
                      setState(() {
                        qus1 = val;
                      });
                    }),
                Text("No"),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Center(
              child: Text(
                "Please specify the numper of parties involved in the incident",
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: num,
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
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => viechalinformation(
                          thereInjuries: qus == "yes" ? true : false,
                          validInsurance: qus1 == "yes" ? true : false,
                          num: num.text),
                    ));
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
        )),
      ),
    );
  }
}
