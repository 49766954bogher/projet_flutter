import 'package:flutter/material.dart';

class AproposDeNous extends StatefulWidget {
  const AproposDeNous({Key? key}) : super(key: key);

  @override
  State<AproposDeNous> createState() => _AproposDeNousState();
}

class _AproposDeNousState extends State<AproposDeNous> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A propos de nous "),
      ),
      body: const Center(
        child: Text(
          " Nous aimons le flutter",
          style: TextStyle(
            fontSize: 40,
            color: Colors.black54,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
