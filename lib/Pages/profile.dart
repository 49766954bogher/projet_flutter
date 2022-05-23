import 'package:flutter/material.dart';
import 'package:taxido/Connection/connection.dart';
import 'package:taxido/Global/global.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profil de chauffeur",
          style: TextStyle(
              fontSize: 12
          ),
        ),
        backgroundColor: Colors.black54,

      ),
      body:Center(
        child:ElevatedButton(
          onPressed: () {
            fAuth.signOut();
            Navigator.push(context,
                MaterialPageRoute(builder: (c) => const Connection()));
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.lightBlueAccent,
          ),
          child: const Text(
            "Quitter",
            style: TextStyle(
              fontSize: 18,
              color: Colors.red,
            ),
          ),
        ),

      )


    );
  }
}
