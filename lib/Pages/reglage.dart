// ignore: file_names
import 'package:flutter/material.dart';

class PageReglage extends StatefulWidget {
  const PageReglage({Key? key}) : super(key: key);

  @override
  State<PageReglage> createState() => _PageReglageState();
}

class _PageReglageState extends State<PageReglage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Reglage",
          style: TextStyle(fontSize: 12),
        ),
        backgroundColor: Colors.black54,
      ),
      body: const Center(
        child: Text("Page des reglages"),
      ),
    );
  }
}
