import 'package:flutter/material.dart';

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
      body:const Center(
        child:  Text("Page de profile"),
      ),
    );
  }
}
