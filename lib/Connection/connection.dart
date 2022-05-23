// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:taxido/Authrntification/auth.dart';
import 'package:taxido/EcranPrincipal/main_screen.dart';

import 'package:taxido/Pages/accueil.dart';

class Connection extends StatefulWidget {
  const Connection({Key? key}) : super(key: key);

  @override
  State<Connection> createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();


  saveConnectionsInfos() {

    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const HomePage()));
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
                controller: login,
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
                  saveConnectionsInfos();
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
