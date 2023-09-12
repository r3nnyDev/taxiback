// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taxiback/screens/loginscren.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(

      apiKey: "AIzaSyCV732x9onUjctKG8VUJn6Agobv0-R3SVA",


projectId: "basetaxi-e9e82",


messagingSenderId: "899303736142",

appId: "1:899303736142:web:be4fba5af591fda8ad941f",

    )
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KaysegTax',
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


