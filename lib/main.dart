// ignore_for_file: prefer_const_constructors

import 'package:bloodforlife/Screens/SignIn/sign_in.dart';
import 'package:bloodforlife/Screens/SignUp/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Check/country_picker_pro.dart';
import 'Screens/Reminder/Reminder.dart';
import 'Screens/splash.dart';
import 'Check/check.dart';
import 'bottom.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBRe-YAQQkYNAVZMHCmyyPZDv8SCj37ORk",
      authDomain: "blood-for-life-8a5f2.firebaseapp.com",
      projectId: "blood-for-life-8a5f2",
      storageBucket: "blood-for-life-8a5f2.appspot.com",
      messagingSenderId: "166250731336",
      appId: "1:166250731336:web:f30eeab92ceafd037a057d",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Smart Blood Donation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Sign_Up(),
    );
  }
}
