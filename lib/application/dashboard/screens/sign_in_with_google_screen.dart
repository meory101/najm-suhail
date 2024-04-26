import 'package:flutter/material.dart';

class SignInWithGoogleScreen extends StatefulWidget {
  const SignInWithGoogleScreen({Key? key}) : super(key: key);

  @override
  State<SignInWithGoogleScreen> createState() => _SignInWithGoogleScreenState();
}

class _SignInWithGoogleScreenState extends State<SignInWithGoogleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Welcome to Najm Suhail smart chat',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Login to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 16.0,
              ),
            ),
            Center(child: Image.asset('assets/images/smart_chat.png')),
            GestureDetector(
              onTap: () async {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Text(
                  'Sign in with google',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
