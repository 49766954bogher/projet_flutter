import 'package:flutter/material.dart';
import 'package:taxido/Pages/accueil.dart';

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
            style: TextStyle(fontSize: 12),
          ),
          backgroundColor: Colors.black54,
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
        body: Card(
          color: Colors.black54,
          child: Container(
            child: Column(children: [
              const Text(
                "Noter votre voyage",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white38,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 4,
                      color: Theme.of(context).scaffoldBackgroundColor),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 10),
                    ),
                  ],
                  shape: BoxShape.circle,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("images/driver.jpg"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.start,
                  ),
                  Icon(Icons.start),
                  Icon(Icons.start),
                  Icon(Icons.start),
                  Icon(Icons.start),
                ],
              ),
            ]),
            height: 300,
            width: 300,
          ),
        ));
  }
}
