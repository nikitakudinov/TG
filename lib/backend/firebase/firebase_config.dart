import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAeFKKruP8wUo3i3ml-QkX5UoUI3mYnEJs",
            authDomain: "pground-34b5a.firebaseapp.com",
            projectId: "pground-34b5a",
            storageBucket: "pground-34b5a.appspot.com",
            messagingSenderId: "539779170742",
            appId: "1:539779170742:web:366e5a1a64865c1ffec117"));
  } else {
    await Firebase.initializeApp();
  }
}
