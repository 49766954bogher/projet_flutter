// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxido/Authrntification/auth.dart';
import 'package:taxido/EcranDemarage/splash_screen.dart';
import 'package:taxido/EcranPrincipal/main_screen.dart';

import 'package:taxido/Pages/accueil.dart';

import '../BoiteGialogue/dialogue.dart';
import '../Global/global.dart';

class Connection extends StatefulWidget {
  const Connection({Key? key}) : super(key: key);

  @override
  State<Connection> createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  validationForm() {
    if (email.text.contains("@")) {
      Fluttertoast.showToast(msg: "email doit contenir un @");
    } else if (password.text.isNotEmpty) {
      Fluttertoast.showToast(msg: "mot de passe de peut pas etre vide ");
    }
  }

  sauvegarderInfosConnection() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return BoiteDeDialogue(message: 'veuillez patienter...');
        });

    final User? firebaseUser = (await fAuth
            .signInWithEmailAndPassword(
                email: email.text.trim(), password: password.text.trim())
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "Error de creation de compte" + msg.toString());
    }))
        .user;

    // enregistrer dans firebase apres la creation de chauffeur

    if (firebaseUser != null) {
      currentUser = firebaseUser;
      Fluttertoast.showToast(msg: "Bienvenue ");
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const MySplashScreen()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: "erreur de mot de passe ou nom d'utilisateur ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset("images/logo1.png"),
              const Text(
                "Connection",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: password,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                    labelText: "Nom d'utilisateur",
                    hintText: "nom d'utilisateur",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscuringCharacter: "*",
                obscureText: true,
                controller: password,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                    labelText: "Mot de passe ",
                    hintText: "mot de passe",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
              const SizedBox(
                height: 18.0,
              ),
              ElevatedButton(
                onPressed: () {
                  sauvegarderInfosConnection();
                  //Navigator.push(context,
                  //MaterialPageRoute(builder: (c) => const HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlueAccent,
                ),
                child: const Text(
                  "Se connecter",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(137, 34, 30, 30),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => SignUp()));
                },
                child: const Text(
                  "Pas de compte, cliquer ici !",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
