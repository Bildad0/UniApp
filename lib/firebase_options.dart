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
    apiKey: 'AIzaSyCiL9ATYW2dI62_OjHJ4WYcNimzT69JwDo',
    appId: '1:708691986820:web:cd4908bad3df30b0cdf5d1',
    messagingSenderId: '708691986820',
    projectId: 'uniapp-bacf3',
    authDomain: 'uniapp-bacf3.firebaseapp.com',
    databaseURL: 'https://uniapp-bacf3-default-rtdb.firebaseio.com',
    storageBucket: 'uniapp-bacf3.appspot.com',
    measurementId: 'G-H0RJ6DECG3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA1IL7IgUV3E9m8_yZmfnBFdWDjFulN-4k',
    appId: '1:708691986820:android:f2cd7f96b2a51c26cdf5d1',
    messagingSenderId: '708691986820',
    projectId: 'uniapp-bacf3',
    databaseURL: 'https://uniapp-bacf3-default-rtdb.firebaseio.com',
    storageBucket: 'uniapp-bacf3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA86x8HK4qsbSCMvatwtlqNPnSQLu9-48Y',
    appId: '1:708691986820:ios:ad1fa444e4104e54cdf5d1',
    messagingSenderId: '708691986820',
    projectId: 'uniapp-bacf3',
    databaseURL: 'https://uniapp-bacf3-default-rtdb.firebaseio.com',
    storageBucket: 'uniapp-bacf3.appspot.com',
    iosClientId:
        '708691986820-6dqtpc53mbc262js2ac8tj45okrlvoq5.apps.googleusercontent.com',
    iosBundleId: 'com.example.uniapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA86x8HK4qsbSCMvatwtlqNPnSQLu9-48Y',
    appId: '1:708691986820:ios:ad1fa444e4104e54cdf5d1',
    messagingSenderId: '708691986820',
    projectId: 'uniapp-bacf3',
    databaseURL: 'https://uniapp-bacf3-default-rtdb.firebaseio.com',
    storageBucket: 'uniapp-bacf3.appspot.com',
    iosClientId:
        '708691986820-6dqtpc53mbc262js2ac8tj45okrlvoq5.apps.googleusercontent.com',
    iosBundleId: 'com.example.uniapp',
  );
}
