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
    apiKey: 'AIzaSyABzJHCw9sZRvXDmLR1PdIhuWLnUDro-q0',
    appId: '1:800319001066:web:89498e9e6cb5ab06df2293',
    messagingSenderId: '800319001066',
    projectId: 'fir-auth-5b9fd',
    authDomain: 'fir-auth-5b9fd.firebaseapp.com',
    storageBucket: 'fir-auth-5b9fd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAfHyCYP-jNKY9UZWNCjf7IXHRTRhk6Mk8',
    appId: '1:800319001066:android:3d5acaa97d7118b5df2293',
    messagingSenderId: '800319001066',
    projectId: 'fir-auth-5b9fd',
    storageBucket: 'fir-auth-5b9fd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAN8cXjqeT_j18zbtaLZNhWUH4DwrGIhus',
    appId: '1:800319001066:ios:3b1735c431e7e676df2293',
    messagingSenderId: '800319001066',
    projectId: 'fir-auth-5b9fd',
    storageBucket: 'fir-auth-5b9fd.appspot.com',
    iosClientId: '800319001066-bhkikdl89d8gh1vl2k1tnp2o1ll50f15.apps.googleusercontent.com',
    iosBundleId: 'com.example.userMgt',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAN8cXjqeT_j18zbtaLZNhWUH4DwrGIhus',
    appId: '1:800319001066:ios:3b1735c431e7e676df2293',
    messagingSenderId: '800319001066',
    projectId: 'fir-auth-5b9fd',
    storageBucket: 'fir-auth-5b9fd.appspot.com',
    iosClientId: '800319001066-bhkikdl89d8gh1vl2k1tnp2o1ll50f15.apps.googleusercontent.com',
    iosBundleId: 'com.example.userMgt',
  );
}
