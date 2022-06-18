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
    apiKey: 'AIzaSyARzH_Qhg6dX6rPkkq73Dt207Jc1rdW_9M',
    appId: '1:604055211768:web:b39565671b15132fedb50d',
    messagingSenderId: '604055211768',
    projectId: 'nakamuraryu-app',
    authDomain: 'nakamuraryu-app.firebaseapp.com',
    storageBucket: 'nakamuraryu-app.appspot.com',
    measurementId: 'G-0MEKTF18GN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAvoSRP7px1dZBMVrXBao1DTTTxWoV614Q',
    appId: '1:604055211768:android:c66ca7e57ff30300edb50d',
    messagingSenderId: '604055211768',
    projectId: 'nakamuraryu-app',
    storageBucket: 'nakamuraryu-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEQDA9PRJWcibVX5KegntPRUWVxM60uIY',
    appId: '1:604055211768:ios:fd26c41c7b2bc67aedb50d',
    messagingSenderId: '604055211768',
    projectId: 'nakamuraryu-app',
    storageBucket: 'nakamuraryu-app.appspot.com',
    iosClientId: '604055211768-6tvtpgfvafg1t2nqih9ka8pc30fnrpli.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDEQDA9PRJWcibVX5KegntPRUWVxM60uIY',
    appId: '1:604055211768:ios:fd26c41c7b2bc67aedb50d',
    messagingSenderId: '604055211768',
    projectId: 'nakamuraryu-app',
    storageBucket: 'nakamuraryu-app.appspot.com',
    iosClientId: '604055211768-6tvtpgfvafg1t2nqih9ka8pc30fnrpli.apps.googleusercontent.com',
    iosBundleId: 'com.example.app',
  );
}
