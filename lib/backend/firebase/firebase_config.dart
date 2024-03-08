import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBh1Elz7snTB7PfpF4amAt0NMsp_iyjyDI",
            authDomain: "curfew-inventory-web-ap-ifkeww.firebaseapp.com",
            projectId: "curfew-inventory-web-ap-ifkeww",
            storageBucket: "curfew-inventory-web-ap-ifkeww.appspot.com",
            messagingSenderId: "422593586539",
            appId: "1:422593586539:web:86c315ba78127c9058d82e"));
  } else {
    await Firebase.initializeApp();
  }
}
