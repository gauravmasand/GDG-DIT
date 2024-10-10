import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDbamzt0G0ErJPOS1gRD4CdIhk_azGLPDg",
            authDomain: "gdg-dit-rlb405.firebaseapp.com",
            projectId: "gdg-dit-rlb405",
            storageBucket: "gdg-dit-rlb405.appspot.com",
            messagingSenderId: "144469176232",
            appId: "1:144469176232:web:bdc344e2f029e00f84779d"));
  } else {
    await Firebase.initializeApp();
  }
}
