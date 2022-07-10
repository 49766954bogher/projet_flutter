//https://www.youtube.com/watch?v=TWcW9-rYCvw&list=PLwj1YcMhLRN1zbN2olMzvIBXP06FIwoes
//import 'package:firebase_core/firebase_core.dart';
// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taxido/EcranDemarage/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MyApp(
      child: MaterialApp(
        title: "Taxi Service pour chauffeur",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MySplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

// Using last version avec nulSafety
class MyApp extends StatefulWidget {
  final Widget? child;

  MyApp({this.child});
// La methode qui va etr appeler dans n'importe quel place pour redemarer lapp
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}
