import 'package:flutter/material.dart';

class Pagechauffeur extends StatefulWidget {
  const Pagechauffeur({Key? key}) : super(key: key);

  @override
  State<Pagechauffeur> createState() => _PagechauffeurState();
}

class _PagechauffeurState extends State<Pagechauffeur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chauffeur"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("images/brms.jpg"),
            const Text(
              "Mes informations",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
