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
    apiKey: 'AIzaSyBhoM-SDEocvN6cVQQFAuZZTI5qyEIHgbw',
    appId: '1:444377525752:web:599f20fa284e34ad8b3a0d',
    messagingSenderId: '444377525752',
    projectId: 'testapp-3864d',
    authDomain: 'testapp-3864d.firebaseapp.com',
    storageBucket: 'testapp-3864d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXVJXsPrpBhs19C45u0ua40WQx6n7BWoM',
    appId: '1:444377525752:android:66475c4a629ab2098b3a0d',
    messagingSenderId: '444377525752',
    projectId: 'testapp-3864d',
    storageBucket: 'testapp-3864d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCR48UPtgcSLICqkiOd_y3Hc1GAUpDG5VI',
    appId: '1:444377525752:ios:4a06e032f748b43c8b3a0d',
    messagingSenderId: '444377525752',
    projectId: 'testapp-3864d',
    storageBucket: 'testapp-3864d.appspot.com',
    iosClientId: '444377525752-r75pi6d51g97e8su9les1il5nfijamsf.apps.googleusercontent.com',
    iosBundleId: 'com.example.testapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCR48UPtgcSLICqkiOd_y3Hc1GAUpDG5VI',
    appId: '1:444377525752:ios:4a06e032f748b43c8b3a0d',
    messagingSenderId: '444377525752',
    projectId: 'testapp-3864d',
    storageBucket: 'testapp-3864d.appspot.com',
    iosClientId: '444377525752-r75pi6d51g97e8su9les1il5nfijamsf.apps.googleusercontent.com',
    iosBundleId: 'com.example.testapp',
  );
}
