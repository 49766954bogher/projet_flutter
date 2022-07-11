import 'package:flutter/material.dart';

import 'accueil.dart';

class HistoryPage extends StatelessWidget {
  final List<ListePassagers> passagers = [
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
        depart: 'arafat'),

    const ListePassagers(
        //salma

        nom: 'Ckeikh',
        email: 'amadou@gmail.com',
        destination: 'pk',
        depart: 'arafat'),
    const ListePassagers(
        //salma

        nom: 'salma',
        email: 'slma@gmail.com',
        destination: 'pk',
        depart: 'arafat'),
    const ListePassagers(
        //salma

        nom: 'Demba',
        email: 'demba@gmail.com',
        destination: 'pk',
        depart: 'arafat'),
    const ListePassagers(
        //salma

        nom: 'salma',
        email: 'slma@gmail.com',
        destination: 'pk',
        depart: 'arafat'),
    const ListePassagers(
        //salma

        nom: 'Baba',
        email: 'baba@gmail.com',
        destination: 'iscae ',
        depart: 'ksar'),
    const ListePassagers(
        //salma

        nom: 'Amadou',
        email: 'amadou@gmail.com',
        destination: 'barsra',
        depart: 'bmd'),
  ];

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
      body: ListView.builder(
        itemCount: passagers.length,
        itemBuilder: ((BuildContext context, int index) {
          final client = passagers[index];

          return Card(
            margin: const EdgeInsets.all(8.0),
            // padding:const EdgeInsets.all(5.0),
            elevation: 4.0,
            child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    client.nom[0],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                  radius: 18,
                ),
                title: Text(client.nom),
                subtitle: Text(client.email),
                trailing: buildItem(client.depart, client.destination)),
          );
        }),
      ),
    );
  }
}

Widget buildItem(start, end) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(start),
        Text(end),
      ],
    );

class ListePassagers {
  final String nom;
  final String email;
  final String destination;
  final String depart;

  const ListePassagers(
      {required this.nom,
      required this.email,
      required this.destination,
      required this.depart});
}
