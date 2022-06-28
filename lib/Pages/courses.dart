import 'package:flutter/material.dart';

import 'infoscourses.dart';

class _MoncourseState extends State<Moncourse> {



  List<ListePassagers> passagers = [
    const ListePassagers(
        //ibrhima

        nom: 'ibrahima',
        email: 'ibrahidiallo300@gmail.com',
        destination: 'ksar',
        depart: 'bmd'),

    //chouaib
    const ListePassagers(
        //Chouaib

        nom: 'chouaib',
        email: 'chouaib@gmail.com',
        destination: 'arafat',
        depart: '24'),

    const ListePassagers(
        //Mimi

        nom: 'Mimi',
        email: 'Mimi@gmail.com',
        destination: 'madrid',
        depart: 'fst'),

    const ListePassagers(
        //salma

        nom: 'salma',
        email: 'slma@gmail.com',
        destination: 'pk',
        depart: 'arafat')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Mes  course"),
        centerTitle: true,
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          final client = passagers[index];

          return Card(
            margin:const EdgeInsets.all(8.0),
           // padding:const EdgeInsets.all(5.0),
            elevation: 4.0,
            child: ListTile(
              leading: CircleAvatar(
                child: Text(client.nom[0],style:const TextStyle(fontSize: 20,color:Colors.black54)),
                radius: 18,
              ),
              title: Text(client.nom),
              subtitle: Text(client.email),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => infosClient(client: client)));
              },
            ),

          );
        }),
      ),
    );
  }
}

class ListePassagers {

  final String nom;
  final String email;
  final String destination;
  final String depart;

  const ListePassagers(
      {
      required this.nom,
      required this.email,
      required this.destination,
      required this.depart});
}

class Moncourse extends StatefulWidget {
  const Moncourse({Key? key}) : super(key: key);

  @override
  State<Moncourse> createState() => _MoncourseState();
}
