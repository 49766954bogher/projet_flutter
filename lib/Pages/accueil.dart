// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:taxido/Connection/connection.dart';
import 'package:taxido/PageChauffeur/chauffeur.dart';
import 'package:taxido/Pages/lire_nous.dart';
import 'package:taxido/Pages/reglage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Accueil",
          style: TextStyle(fontSize: 12),
        ),
        backgroundColor: Colors.black54,
      ),
      body: const Center(
        child: Text("page d'accueil"),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItems(BuildContext context) => Container(
        color: Colors.black54,
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Accueil"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                }),
            ListTile(
              leading: const Icon(Icons.notification_important),
              title: const Text("Notification"),
              onTap: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Colors.black54,
              thickness: 1.0,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Reglage"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const PageReglage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("A propos de nous "),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AproposDeNous()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Deconnecter"),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Connection()));
              },
            ),
            ListTile(leading: const Icon(Icons.help), title: const Text("Aide"))
          ],
        ),
      );

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.grey.shade700,
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Pagechauffeur()));
          },
          child: Column(
            children: const [
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage(
                  "images/brms.jpg",
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Mon chauffeur",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                "www.chauffeur@gmail.com",
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      );
}
