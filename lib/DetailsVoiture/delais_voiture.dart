import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailsVoiture extends StatefulWidget {
  const DetailsVoiture({Key? key}) : super(key: key);

  @override
  State<DetailsVoiture> createState() => _DetailsVoitureState();
}

class _DetailsVoitureState extends State<DetailsVoiture> {
  TextEditingController model = TextEditingController();
  TextEditingController matricule = TextEditingController();
  TextEditingController couleur = TextEditingController();

  List DesTypeVoitures = [
    "toyata",
    "peugeot",
    "corolla",
    "nissan",
    "marcedece"
  ];
  String? onSelectedTypeVoiture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 80.0,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset("images/logo1.png"),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            "Les details de la voiture",
            style: TextStyle(
                fontSize: 25, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          TextField(
            keyboardType: TextInputType.name,
            controller: model,
            style: const TextStyle(
              color: Colors.grey,
            ),
            decoration: const InputDecoration(
                labelText: "Model",
                hintText: "model",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
          TextField(
            controller: matricule,
            style: const TextStyle(
              color: Colors.grey,
            ),
            decoration: const InputDecoration(
                labelText: "Matricule",
                hintText: "matricule",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
          TextField(
            controller: matricule,
            style: const TextStyle(
              color: Colors.grey,
            ),
            decoration: const InputDecoration(
                labelText: "Couleur",
                hintText: "couleur",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),

          SizedBox(height: 10),
          DropdownButton(
            iconSize: 20,
            dropdownColor: Colors.black26,
            hint: const Text(
              "Choisir une voiture",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
            value: onSelectedTypeVoiture,
            onChanged: (noewvalue) {
              void InitSet(noewvalue) {
                onSelectedTypeVoiture = noewvalue;
              }
            },
            items: DesTypeVoitures.map((voitures) {
              return DropdownMenuItem(
                child: Text(
                  voitures,
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
                value: voitures,
              );
            }).toList(),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.lightGreenAccent,
            ),
            child: const Text(
              "Enregistrer",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white54,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
