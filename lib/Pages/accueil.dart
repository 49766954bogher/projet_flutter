import 'package:flutter/material.dart';
import 'package:taxido/Connection/connection.dart';
import 'package:taxido/Pages/lire_nous.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [widget],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.grey,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
          },
          child: Column(
            children: const [
              CircleAvatar(
                radius: 52,
                backgroundImage: AssetImage("images/driver.jpg"),
              ),
              SizedBox(height: 12),
              Text(
                "Mon chauffeur",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                "www.monChauffeur@gmail.com",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Accueil"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.notification_important),
              title: const Text("Notification"),
              onTap: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              color: Colors.white70,
              thickness: 6.0,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Reglage"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("A propos de nous "),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AproposDeNous(),
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Deconnecter"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Connection(),
                ));
              },
            ),
          ],
        ),
      );
}
