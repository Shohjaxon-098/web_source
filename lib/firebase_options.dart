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
    apiKey: 'AIzaSyDL2tX_HCIQeTNBb6ekCYAiLLDhXE7QOOw',
    appId: '1:445638539890:web:864a0df96584692ee8a0eb',
    messagingSenderId: '445638539890',
    projectId: 'authenticationwith-1420f',
    authDomain: 'authenticationwith-1420f.firebaseapp.com',
    storageBucket: 'authenticationwith-1420f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA6-YVEWzkPwCEYvvxI1HysddcLEjocZQk',
    appId: '1:445638539890:android:2a974f11b211aa39e8a0eb',
    messagingSenderId: '445638539890',
    projectId: 'authenticationwith-1420f',
    storageBucket: 'authenticationwith-1420f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNrTmTKsToL2eSK5euMczeyySU-rTa0M0',
    appId: '1:445638539890:ios:2f649e24f71e965ce8a0eb',
    messagingSenderId: '445638539890',
    projectId: 'authenticationwith-1420f',
    storageBucket: 'authenticationwith-1420f.appspot.com',
    iosClientId: '445638539890-ckdtpq2r9clbp0kgmp1ohgd90a8i0ans.apps.googleusercontent.com',
    iosBundleId: 'com.example.webSource',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNrTmTKsToL2eSK5euMczeyySU-rTa0M0',
    appId: '1:445638539890:ios:a8bfdde9af83f7d1e8a0eb',
    messagingSenderId: '445638539890',
    projectId: 'authenticationwith-1420f',
    storageBucket: 'authenticationwith-1420f.appspot.com',
    iosClientId: '445638539890-floumakg217vcvuusvvc3ojkteaph2m1.apps.googleusercontent.com',
    iosBundleId: 'com.example.webSource.RunnerTests',
  );
}
