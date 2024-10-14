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
        return macos;
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
    apiKey: 'AIzaSyCYbNo9PYWi8wcvYr18jVq0x-rpMkaeQNc',
    appId: '1:1018307728212:web:53b276fc7bf1d3e3af6ec1',
    messagingSenderId: '1018307728212',
    projectId: 'customer-manager-2cab5',
    authDomain: 'customer-manager-2cab5.firebaseapp.com',
    storageBucket: 'customer-manager-2cab5.appspot.com',
    measurementId: 'G-ESCYG77XP0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDkElVUjCJYmjPFm3RjFlmuP6ifssDUu6s',
    appId: '1:1018307728212:android:9303eba1eb983094af6ec1',
    messagingSenderId: '1018307728212',
    projectId: 'customer-manager-2cab5',
    storageBucket: 'customer-manager-2cab5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCfM_X3l5vXnySiY3nsOWBuhTtFXSSv3Lc',
    appId: '1:1018307728212:ios:685f2402c6db3fb4af6ec1',
    messagingSenderId: '1018307728212',
    projectId: 'customer-manager-2cab5',
    storageBucket: 'customer-manager-2cab5.appspot.com',
    iosBundleId: 'com.ahmadhabibshovo.userManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCfM_X3l5vXnySiY3nsOWBuhTtFXSSv3Lc',
    appId: '1:1018307728212:ios:685f2402c6db3fb4af6ec1',
    messagingSenderId: '1018307728212',
    projectId: 'customer-manager-2cab5',
    storageBucket: 'customer-manager-2cab5.appspot.com',
    iosBundleId: 'com.ahmadhabibshovo.userManager',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCYbNo9PYWi8wcvYr18jVq0x-rpMkaeQNc',
    appId: '1:1018307728212:web:73f49a0e04a82f2aaf6ec1',
    messagingSenderId: '1018307728212',
    projectId: 'customer-manager-2cab5',
    authDomain: 'customer-manager-2cab5.firebaseapp.com',
    storageBucket: 'customer-manager-2cab5.appspot.com',
    measurementId: 'G-SZGPBRLRNX',
  );
}