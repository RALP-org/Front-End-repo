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
        return macos;
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
    apiKey: 'AIzaSyBtfEJjdxp8_BqHTmJokBoZPBcLxL4kv5o',
    appId: '1:6005151739:web:3bb0d30d445d4f74fa5d5e',
    messagingSenderId: '6005151739',
    projectId: 'ralp-f3851',
    authDomain: 'ralp-f3851.firebaseapp.com',
    storageBucket: 'ralp-f3851.appspot.com',
    measurementId: 'G-NLPS9WWTNZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhCs5a2_VHmGCC9FmawmgOVJ4iR0V1J-4',
    appId: '1:6005151739:android:4e9f178a79c22414fa5d5e',
    messagingSenderId: '6005151739',
    projectId: 'ralp-f3851',
    storageBucket: 'ralp-f3851.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBlH5GHZablDtG_lHCgIp2w0Yfm7p3BxNg',
    appId: '1:6005151739:ios:acc55aba1bb05f16fa5d5e',
    messagingSenderId: '6005151739',
    projectId: 'ralp-f3851',
    storageBucket: 'ralp-f3851.appspot.com',
    iosClientId: '6005151739-g5u2eaees8fppu27ntl21js5v7tqfkdr.apps.googleusercontent.com',
    iosBundleId: 'com.example.ralp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBlH5GHZablDtG_lHCgIp2w0Yfm7p3BxNg',
    appId: '1:6005151739:ios:acc55aba1bb05f16fa5d5e',
    messagingSenderId: '6005151739',
    projectId: 'ralp-f3851',
    storageBucket: 'ralp-f3851.appspot.com',
    iosClientId: '6005151739-g5u2eaees8fppu27ntl21js5v7tqfkdr.apps.googleusercontent.com',
    iosBundleId: 'com.example.ralp',
  );
}