import 'package:flutter/material.dart';

class PaiementPage extends StatefulWidget {
  const PaiementPage({Key? key}) : super(key: key);

  @override
  State<PaiementPage> createState() => _PaiementPageState();
}

class _PaiementPageState extends State<PaiementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Paiement de chauffeur",
          style: TextStyle(
              fontSize: 12
          ),
        ),
        backgroundColor: Colors.black54,

      ),
      body:const Center(
        child:  Text("Page des paiements"),
      ),
    );
  }
}
