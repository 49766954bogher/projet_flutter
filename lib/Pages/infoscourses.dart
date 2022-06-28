import 'package:flutter/material.dart';
import 'package:taxido/Pages/courses.dart';

class infosClient extends StatelessWidget {
  final ListePassagers client;

  const infosClient({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(client.nom),
      ),
      body: Column(
        children: <Widget>[

          Text(client.nom[0],style: const TextStyle(fontSize: 20, color:Colors.black54) ),
          const SizedBox(
            height: 2,
          ),
          Text(client.nom),
          Text(client.email),
          Text(client.destination),
          Text(client.depart)
        ],
      ),
    );
  }
}
