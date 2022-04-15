import 'package:flutter/material.dart';
import 'package:webpage/webPage.dart';

import 'testdemo/homepage.dart';
import 'homescreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (Firebase.apps.length > 1) {
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCe_RmGh2-BCuPPBWmnNRPy2MstSlhC-70",
        authDomain: "web-page-c1504.firebaseapp.com",
        projectId: "web-page-c1504",
        storageBucket: "web-page-c1504.appspot.com",
        messagingSenderId: "779832916384",
        appId: "1:779832916384:web:fb50303328c32e5e680cc5"),
  );
  // }
  // else {
  //   Firebase.app();
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
