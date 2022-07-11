import 'package:flutter/material.dart';

import 'accueil.dart';

class FaireCourse extends StatefulWidget {
  const FaireCourse({Key? key}) : super(key: key);

  @override
  State<FaireCourse> createState() => _FaireCourseState();
}

class _FaireCourseState extends State<FaireCourse>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<ListePassagers> passagers = [
    const ListePassagers(
        //ibrhima

        nom: 'Ibrahima',
        email: 'ibrahidiallo300@gmail.com',
        destination: 'ksar',
        depart: 'bmd'),

    //chouaib
    const ListePassagers(
        //Chouaib

        nom: 'Chouaib',
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

        nom: 'Salma',
        email: 'slma@gmail.com',
        destination: 'pk',
        depart: 'arafat'),
    const ListePassagers(
        //salma

        nom: 'Sidi',
        email: 'sidi@gmail.com',
        destination: 'basra',
        depart: 'sabah'),
    const ListePassagers(
        //salma

        nom: 'Oumar',
        email: 'oumar@gmail.com',
        destination: 'cardialogue',
        depart: 'bmd'),
    const ListePassagers(
        //salma

        nom: 'Salem',
        email: 'salem@gmail.com',
        destination: 'ksar',
        depart: 'Fst'),
    const ListePassagers(
        //salma

        nom: 'Souleymane',
        email: 'souleymane@gmail.com',
        destination: 'pk9',
        depart: 'pk10'),
    const ListePassagers(
        //salma

        nom: 'Moktar',
        email: 'moktar@gmail.com',
        destination: '  arafat',
        depart: '5 eme'),
    const ListePassagers(
        //salma

        nom: 'Abd-Rahim',
        email: 'AbdRahim@gmail.com',
        destination: 'poto 3',
        depart: 'pk7'),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

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
            elevation: 2.0,
            child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.yellowAccent,
                  child: Text(
                    client.nom[0],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  radius: 25,
                ),
                title: Text(client.nom),
                subtitle: buildItems(client.depart, client.destination),
                trailing: buildItem(Icons.delete, Icons.done)),
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
      {required this.nom,
      required this.email,
      required this.destination,
      required this.depart});
}

Widget buildItems(start, end) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(start),
        Text(end),
      ],
    );
Widget buildItem(icon1, icon2) =>
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      IconButton(
        onPressed: () {
          print('ignored');
        },
        icon: icon1,
        color: Colors.black54,
      ),
      IconButton(
        onPressed: () {
          print('accepted');
        },
        icon: icon2,
        color: Colors.black54,
      ),
    ]);
