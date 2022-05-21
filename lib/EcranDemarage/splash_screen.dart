import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taxido/Connection/connection.dart';
// ignore: unused_import
import 'package:taxido/EcranPrincipal/main_screen.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
      //montrer utilisateur la page principale
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const Connection()));
    });
  }

  @override
  // la ùethode qui sera premier a executer losque user est dans la home screen
  void initState() {
    super.initState();
    startTimer();
  }

  // Ce que  user va observer
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/driver.jpg"),
              const Text(
                "taxido app",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
