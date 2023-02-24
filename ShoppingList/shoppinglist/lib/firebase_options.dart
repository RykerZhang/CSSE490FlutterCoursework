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

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyADmLoEC1HOqb_EUuY7CxmOvqnLoa9U8jQ',
    appId: '1:1064225457298:web:8a8bcb7fb0427207e8524b',
    messagingSenderId: '1064225457298',
    projectId: 'shoplist-b9eab',
    authDomain: 'shoplist-b9eab.firebaseapp.com',
    storageBucket: 'shoplist-b9eab.appspot.com',
    measurementId: 'G-44E2PJWS7H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJ13gkLj4aEEgAbkT6jNXgeUN-u6LooTE',
    appId: '1:1064225457298:android:1869ddcb226e5fd3e8524b',
    messagingSenderId: '1064225457298',
    projectId: 'shoplist-b9eab',
    storageBucket: 'shoplist-b9eab.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRF4b2d_EV7_-rqkKJgaErdBQsYD339Fo',
    appId: '1:1064225457298:ios:d810c7812c2ba9ace8524b',
    messagingSenderId: '1064225457298',
    projectId: 'shoplist-b9eab',
    storageBucket: 'shoplist-b9eab.appspot.com',
    iosClientId: '1064225457298-n0vm79trajpcjfogi5kpei7sg31cqdr0.apps.googleusercontent.com',
    iosBundleId: 'com.example.shoppinglist',
  );
}
