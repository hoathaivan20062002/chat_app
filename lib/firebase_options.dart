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

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCczVoRQ_mcYyZDN592Q9KLdtK7YZqWUdU',
    appId: '1:229838833305:web:5dfac56fcf13b7cf269a08',
    messagingSenderId: '229838833305',
    projectId: 'chatapps-fe4b4',
    authDomain: 'chatapps-fe4b4.firebaseapp.com',
    databaseURL: 'https://chatapps-fe4b4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chatapps-fe4b4.appspot.com',
    // measurementId: 'G-S3Q75GK9S7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAoTB2BqZu_GsPoa3Z4gJJaCtzKb14Q90k',
    appId: '1:229838833305:android:c5649178489e4ab3269a08',
    messagingSenderId: '229838833305',
    projectId: 'chatapps-fe4b4',
    databaseURL: 'https://chatapps-fe4b4-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'chatapps-fe4b4.appspot.com',
  );
}
