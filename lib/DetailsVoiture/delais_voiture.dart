import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:taxido/Connection/connection.dart';
import 'package:taxido/Global/global.dart';

class DetailsVoiture extends StatefulWidget {
  const DetailsVoiture({Key? key}) : super(key: key);

  @override
  State<DetailsVoiture> createState() => _DetailsVoitureState();
}

class _DetailsVoitureState extends State<DetailsVoiture> {
  TextEditingController model = TextEditingController();
  TextEditingController matricule = TextEditingController();
  TextEditingController couleur = TextEditingController();

  // ignore: non_constant_identifier_names
  List DesTypeVoitures = [
    "toyata",
    "peugeot",
    "corolla",
    "nissan",
    "marcedece"
  ];

  String? onSelectedTypeVoiture;

  saveInfosCars() {
    Map MapsVoiture = {
      "Model": model.text.trim(),
      "Matricule": matricule.text.trim(),
      "Couleur": couleur.text.trim(),
      "type": onSelectedTypeVoiture,
    };

    DatabaseReference chauffeurRef =
        FirebaseDatabase.instance.ref().child("chauffeur");

    chauffeurRef
        .child(currentUser!.uid)
        .child("details des voitures")
        .set(MapsVoiture);

    Fluttertoast.showToast(
        msg: "les informations de ton voiture sont bien enregister");

    Navigator.push(
        context, MaterialPageRoute(builder: (c) => const Connection()));
  }

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

          const SizedBox(height: 10),
          DropdownButton(
            iconSize: 20,
            dropdownColor: Colors.black26,
            hint: const Text(
              "Choisissez votre voiture",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.0,
              ),
            ),
            value: onSelectedTypeVoiture,
            onChanged: (noewvalue) {
              // ignore: unused_element
              void initSet(newvalue) {
                onSelectedTypeVoiture = newvalue;
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

            onPressed: () {
              if (model.text.isNotEmpty &&
                  matricule.text.isNotEmpty &&
                  couleur.text.isNotEmpty &&
                  onSelectedTypeVoiture != null) {
                saveInfosCars();
              }


            },

            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlueAccent,
            ),

            child: const Text(
              "Terminer",
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
