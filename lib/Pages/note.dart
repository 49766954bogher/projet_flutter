import 'package:flutter/material.dart';
import 'package:taxido/Pages/accueil.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 1,
        backgroundColor: Colors.black54,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => const HomePage()));
          },
        ),
      ),
      body: Container(),
    );
  }
}
