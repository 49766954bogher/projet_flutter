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
          style: TextStyle(fontSize: 12),
        ),
      ),
      backgroundColor: Colors.black54,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset("images/driver.jpg", height: 200, fit: BoxFit.cover),
              const Padding(
                padding: EdgeInsets.only(top: 130),
                child: CircleAvatar(
                  radius: 75,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("images/brms.jpg"),
                  ),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
