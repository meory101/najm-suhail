import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/application/authentication/screens/login_screen.dart';
import 'package:flutter_application_2/application/authentication/screens/sign_up_screen.dart';
import 'package:flutter_application_2/application/dashboard/screens/customer_service_faq_answer_screen.dart';
import 'package:flutter_application_2/application/dashboard/screens/dashboard_tab.dart';
import 'package:flutter_application_2/application/dashboard/screens/sign_in_with_google_screen.dart';
import 'package:flutter_application_2/application/home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/authentication/screens/splash_screen.dart';
import 'firebase_options.dart';

extension name on String {
  CheckName() {
    return this.length >= 4;
  }
}

extension IsEmail on String {
  CheckEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}

extension Password on String {
  bool IsPassword() {
    return this.length >= 6;
  }
}

extension number on String {
  bool checkphone() {
    return this.length == 10;
  }
}

extension nat on String {
  bool checkNat() {
    return this.length == 9;
  }
}

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    @override
  void initState() {
    print('gggggggggggggggggggggggg');
    if (prefs!.getString('roleid') != null) {
      print(prefs!.getString('roleid'));
      if (prefs!.getString('roleid') == "user") {
        role = "user";
      } else if (prefs!.getString('roleid') == "admin") {
        role = "admin";
      }
    }
  }
  @override
  String? role;



  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: role == null
            ? LoginScreen()
            : role == "user"
                ? HomeScreen()
                : DashboardTab());
  }
}
