import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/home/screens/home_screen.dart';
import 'package:flutter_application_2/main.dart';
import 'package:intl/intl.dart';

import '../../../utils/functions.dart';

const List<String> genders = [
  'Male',
  'Female',
];

const List<String> cities = [
  'City1',
  'City2',
  'City3',
  'City4',
  'City5',
];

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int selectedtype = 0;
  TextEditingController? nameController = TextEditingController();
  TextEditingController? nationalIdController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? confirmPasswordController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? birthDateController = TextEditingController();
  TextEditingController? phoneNumberController = TextEditingController();
  final GlobalKey<FormState> fkey = GlobalKey();

  String? gender;
  String? city;

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
                padding: EdgeInsets.only(top: 5.0, bottom: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello ',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'there',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
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
                      if (!p0.CheckName()) {
                        return "enter valid name";
                      }
                    } else {
                      return 'rquired';
                    }
                  },
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Name*',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Container(
                height: 40.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
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
                  controller: nationalIdController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'National Id*',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.1, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Container(
                height: 40.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
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
                        return "enter valid password";
                      }
                    } else {
                      return 'rquired';
                    }
                  },
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Password*',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.1, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Container(
                height: 40.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
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
                        return "enter valid password";
                      }
                    } else {
                      return 'rquired';
                    }
                  },
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Confirm password*',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.1, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Container(
                height: 40.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
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
                      if (!p0.CheckEmail()) {
                        return "enter valid email";
                      }
                    } else {
                      return 'rquired';
                    }
                  },
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: 'Email*',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.1, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  DateTime? selectedBirthDate =
                      await Functions.showDatePickerFunction(context: context);
                  if (selectedBirthDate != null) {
                    birthDateController!.text =
                        DateFormat('yMd').format(selectedBirthDate!);
                  }
                },
                child: Container(
                  height: 40.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 3.0, horizontal: 40.0),
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
                      } else {
                        return 'rquired';
                      }
                    },
                    controller: birthDateController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      hintText: 'Birth date',
                      hintStyle: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.1, horizontal: 10.0),
                      suffixIcon: Icon(
                        Icons.date_range,
                        color: Colors.grey,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    cursorColor: Colors.black,
                    enabled: false,
                  ),
                ),
              ),
              Container(
                height: 40.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
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
                      if (!p0.checkphone()) {
                        return "enter valid phone number";
                      }
                    } else {
                      return 'rquired';
                    }
                  },
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Phone number*',
                    hintStyle: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0.1, horizontal: 10.0),
                  ),
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              Container(
                height: 40.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: gender,
                    hint: Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor: Colors.grey,
                    isDense: true,
                    isExpanded: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.1, horizontal: 10.0),
                    items: genders
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                ),
              ),
              Container(
                height: 40.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
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
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: city,
                    hint: Text(
                      'City*',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                    iconDisabledColor: Colors.grey,
                    iconEnabledColor: Colors.grey,
                    isDense: true,
                    isExpanded: true,
                    padding: const EdgeInsets.symmetric(
                        vertical: 0.1, horizontal: 10.0),
                    items: cities
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        city = value!;
                      });
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  var user;
                  if (passwordController!.text !=
                      confirmPasswordController!.text) {
                    Functions.showDialogFunction(
                      context: context,
                      data: 'pasword does not match',
                      onTapYes: () {},
                    );
                  } else {
                    if (fkey.currentState!.validate() &&
                        city != null &&
                        gender != null) {
                      user = await FirebaseFirestore.instance
                          .collection('users')
                          .add({
                        "name": "${nameController?.text}",
                        "email": "${emailController?.text}",
                        "password":
                            "${passwordController?.text}".replaceAll(" ", ""),
                        "national id":
                            "${nationalIdController?.text}".replaceAll(" ", ""),
                        "phonenum": "${phoneNumberController?.text}",
                        "birthday ": "${birthDateController?.text}",
                        "gender ": "${gender}",
                        "city": "${city}",
                        "roleid": "user"
                      }).then((_) async {
                        prefs!.setString('id', "${user.docs[0].reference.id}");

                        await prefs!.setString('roleid', "user");
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeScreen();
                            },
                          ),
                          (route) => false,
                        );
                      }).catchError((_) {
                        print("an error occured");
                      });
                    } else {
                      Functions.showDialogFunction(
                        context: context,
                        data: 'All fields required and must be validate',
                        onTapYes: () {},
                      );
                    }
                  }
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      top: 50.0, bottom: 5.0, left: 40.0, right: 40.0),
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
                    'Sign up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12.0,
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
