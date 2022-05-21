import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Noter votre voyage",
          style: TextStyle(
            fontSize: 12
          ),
        ),
        backgroundColor: Colors.black54,

      ),
      body:const Center(
        child:  Text("Noter votre dernier voyage"),
      ),
    );



  }
}
