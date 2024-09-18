// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBQlBA9F5laZqMQHUXnHni3LK2K5AzzpVY',
    appId: '1:161178314752:web:04e0c0cfe16aa454d6d0e5',
    messagingSenderId: '161178314752',
    projectId: 'ecommerceapp-2e2d9',
    authDomain: 'ecommerceapp-2e2d9.firebaseapp.com',
    storageBucket: 'ecommerceapp-2e2d9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdT145kunFPsDjiY-BdjgYr9heUjREUDU',
    appId: '1:161178314752:android:9a66ed5737b1118dd6d0e5',
    messagingSenderId: '161178314752',
    projectId: 'ecommerceapp-2e2d9',
    storageBucket: 'ecommerceapp-2e2d9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzm_Qib7hj1A51FMbe1TxjjuxuMS8LfN8',
    appId: '1:161178314752:ios:291fd5cc792a1bc7d6d0e5',
    messagingSenderId: '161178314752',
    projectId: 'ecommerceapp-2e2d9',
    storageBucket: 'ecommerceapp-2e2d9.appspot.com',
    androidClientId: '161178314752-d718bp5pc92ql79spuj2jnblas1aireg.apps.googleusercontent.com',
    iosClientId: '161178314752-h4bnhvl4nn9mt8qo986m6ftqvunhjt0c.apps.googleusercontent.com',
    iosBundleId: 'com.example.myStore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBQlBA9F5laZqMQHUXnHni3LK2K5AzzpVY',
    appId: '1:161178314752:web:7d146b5cd83b61c9d6d0e5',
    messagingSenderId: '161178314752',
    projectId: 'ecommerceapp-2e2d9',
    authDomain: 'ecommerceapp-2e2d9.firebaseapp.com',
    storageBucket: 'ecommerceapp-2e2d9.appspot.com',
  );

}