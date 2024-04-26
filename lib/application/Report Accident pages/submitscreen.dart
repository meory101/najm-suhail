import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/home/widgets/app_bar_widget.dart';

class Submitpage extends StatefulWidget {
  const Submitpage({super.key});

  @override
  State<Submitpage> createState() => _SubmitpageState();
}

class _SubmitpageState extends State<Submitpage> {
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
        body: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/logo.jpg"))),
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Thank you",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.green[800],
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Your report has been  you",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "successfully",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "subnitted!",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.green[700],
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    " Rebort ID: 2",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.file_copy_outlined,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
              width: 180,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(50)),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "The final  Dession will be",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.green[800],
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "sent soon",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.green[800],
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }
}
