// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdm6s-XbpL0Gj4uYTxz8e9LfMYwt4QcZ8',
    appId: '1:154350716305:android:b0d4250a77dce831e88630',
    messagingSenderId: '154350716305	',
    projectId: 'najms-567a6',
    storageBucket: 'najms-567a6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBW4E0btK7uZ-s0A5czEcIgdZP0piq4cPE',
    appId: '1:154350716305:ios:b86b8fd1d6ae4783e88630',
    messagingSenderId: '154350716305',
    projectId: 'najms-567a6',
    storageBucket: 'najms-567a6.appspot.com',
    // androidClientId: '1005856368235-5bi25jg4ufh2r6fp4rvvg1u4bnqjpbcg.apps.googleusercontent.com',
    // iosClientId: '1005856368235-nkfb0uiqlj300fkkr1c1hvvmr5g3i3tg.apps.googleusercontent.com',
    // iosBundleId: 'com.example.najmSuhail',
  );
}