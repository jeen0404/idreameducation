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
      return web;
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDQa2zmoOPsK6vm4_KZwkf9XD1RAft0M58',
    appId: '1:636015607975:web:cbf22444d9c31dfa285b82',
    messagingSenderId: '636015607975',
    projectId: 'idreamedu',
    authDomain: 'idreamedu.firebaseapp.com',
    storageBucket: 'idreamedu.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAG1sgrjzJmJEKYC8YNAfXY3ucmaM_amfY',
    appId: '1:636015607975:android:a3a5e7dd4c0106ee285b82',
    messagingSenderId: '636015607975',
    projectId: 'idreamedu',
    storageBucket: 'idreamedu.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvig0X8uocdYdy4lUMGhtRZ9YpZe_FKFU',
    appId: '1:636015607975:ios:2a9f990d95a8b4d2285b82',
    messagingSenderId: '636015607975',
    projectId: 'idreamedu',
    storageBucket: 'idreamedu.appspot.com',
    iosClientId: '636015607975-tkfdq83ee4g494nu312v45vr706bmm3e.apps.googleusercontent.com',
    iosBundleId: 'com.example.idreamedu',
  );
}