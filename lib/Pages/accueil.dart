import 'package:flutter/material.dart';
import 'package:taxido/Connection/connection.dart';
import 'package:taxido/PageChauffeur/chauffeur.dart';
import 'package:taxido/Pages/lire_nous.dart';
import 'package:taxido/Pages/note.dart';
import 'package:taxido/Pages/paiement.dart';
import 'package:taxido/Pages/profile.dart';
import 'package:taxido/Pages/reglage.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Global/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _controllerGoogleMaps = Completer();
  GoogleMapController? controllerChauffeur;

  static const CameraPosition _kGooglePlex = CameraPosition(
    //target: LatLng(37.42796133580664, -122.085749655962),
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

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
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMaps.complete(controller);
              controllerChauffeur = controller;
            },
          ),
        ],
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
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Accueil"),
                onTap: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                }),
            ListTile(
                leading: const Icon(Icons.credit_card_outlined),
                title: const Text("Paiement"),
                onTap: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const PaiementPage()));
                }),
            ListTile(
                leading: const Icon(Icons.star),
                title: const Text("Note"),
                onTap: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const NotePage()));
                }),
            ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Profil"),
                onTap: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ProfilePage()));
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
                //Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const PageReglage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text("A propos de nous "),
              onTap: () {
                //Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AproposDeNous()));
              },
            ),
            const ListTile(leading: Icon(Icons.help), title: Text("Aide")),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text("Deconnecter"),
              onTap: () async {
                await fAuth.signOut();
                //Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Connection()));
              },
            ),
          ],
        ),
      );

  Widget buildHeader(BuildContext context) => Material(
        color: Colors.black45,
        child: InkWell(
          onTap: () {
            //Navigator.pop(context);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Pagechauffeur()));
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
              left: 80,
              right: 80,
            ),
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('images/icons8-driver-64.png'),
                  backgroundColor: Colors.black45,
                ),
                SizedBox(height: 12.0),
                Text(
                  "Chauffeur",
                  style: TextStyle(color: Colors.black54),
                ),
                Text('brms@gmail.com', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      );
}
