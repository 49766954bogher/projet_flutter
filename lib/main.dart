//import 'package:firebase_core/firebase_core.dart';
// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taxido/Connection/connection.dart';
// ignore: unused_import
import 'package:taxido/EcranDemarage/splash_screen.dart';
// ignore: unused_import
import 'package:taxido/EcranPrincipal/main_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:taxido/Pages/accueil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(
      child: MaterialApp(
        title: "Taxido",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          backgroundColor: Colors.black,
          splash: 'images/driver.jpg',
          nextScreen: FirebaseAuth.instance.currentUser == null
              ? const Connection()
              : const HomePage(),
          splashTransition: SplashTransition.scaleTransition,
        ),
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
