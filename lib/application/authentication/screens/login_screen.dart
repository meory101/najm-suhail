import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/authentication/screens/sign_up_screen.dart';
import 'package:flutter_application_2/application/dashboard/screens/customer_service_faq_answer_screen.dart';
import 'package:flutter_application_2/application/dashboard/screens/dashboard_tab.dart';
import 'package:flutter_application_2/main.dart';

import '../../../utils/functions.dart';
import '../../home/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var user;
  GlobalKey<FormState> fkey = GlobalKey();
  final TextEditingController natController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: fkey,
          child: Column(
            children: [
              SizedBox(
                width: 125.0,
                height: 125.0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25.0)),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25.0, bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'back',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
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
                child: TextFormField(
                  validator: (p0) {
                    if (p0 != null && p0.isNotEmpty) {
                      if (!p0.checkNat()) {
                        return "enter valid national id";
                      }
                    } else {
                      return 'rquired';
                    }
                  },
                  controller: natController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'national *id ',
                    hintStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
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
              Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
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
                child: TextFormField(
                  validator: (p0) {
                    if (p0 != null && p0.isNotEmpty) {
                      if (!p0.IsPassword()) {
                        return "enter valid password ";
                      }
                    } else {
                      return 'rquired';
                    }
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Password*',
                    hintStyle: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
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
              const Text(
                'OR',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.green,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.green,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: 1.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (fkey.currentState!.validate()) {
                    Functions.showLoaderFunction(context: context);

                    user = await FirebaseFirestore.instance
                        .collection('users')
                        .where('national id',
                            isEqualTo:
                                "${natController.text}".replaceAll(" ", ""))
                        .where('password',
                            isEqualTo: "${passwordController.text}")
                        .get();
                    if (user != null && user.docs.isNotEmpty) {
                      if (user.docs[0].data()['roleid'] == "user") {
                        prefs!.setString('roleid', "user");
                        prefs!.setString('id', "${user.docs[0].reference.id}");
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                          (route) => false,
                        );
                      } else {
                        prefs!.setString('roleid', "admin");
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) {
                              return DashboardTab();
                            },
                          ),
                          (route) => false,
                        );
                      }
                    }
                  } else {
                    Functions.showDialogFunction(
                      context: context,
                      data: 'All fields required and must be validate',
                      onTapYes: () {},
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                      vertical: 40.0, horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: const Offset(0.0, 1.0),
                        blurRadius: 0.5,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: const Text(
                    'Login',
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
        ),
      ),
    );
  }
}
