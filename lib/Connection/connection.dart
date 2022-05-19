import 'package:flutter/material.dart';
import 'package:taxido/Authrntification/auth.dart';

class Connection extends StatefulWidget {
  const Connection({Key? key}) : super(key: key);

  @override
  State<Connection> createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 18),
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
                    labelText: "Login",
                    hintText: "login",
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
                controller: password,
                style: const TextStyle(
                  color: Colors.grey,
                ),
                decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "password",
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
              const SizedBox(
                height: 14.0,
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //context, MaterialPageRoute(builder: (c) => ()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                ),
                child: const Text(
                  "Connection",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white54,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) => SignUp()));
                },
                child: const Text(
                  "Pas de compte, cliquer ici",
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
