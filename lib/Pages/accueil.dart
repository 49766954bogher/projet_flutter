import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxido/Connection/connection.dart';
import 'package:taxido/Pages/lire_nous.dart';
import 'package:taxido/Pages/note.dart';
import 'package:taxido/Pages/paiement.dart';
import 'package:taxido/Pages/profile.dart';
import 'package:taxido/Pages/reglage.dart';
import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Global/global.dart';
import 'history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController depart = TextEditingController();
  TextEditingController destination = TextEditingController();
  // LatLng _lastPosition = _inialPosition;

  //static const _inialPosition = LatLng(18.0735411, -15.9582337);

  final Completer<GoogleMapController> _controllerGoogleMaps = Completer();
  GoogleMapController? controllerChauffeur;
  GlobalKey<ScaffoldState> scafoldkey = GlobalKey<ScaffoldState>();
  Position? currentPosition;
  var geolocalor = Geolocator();

  void getPositionLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        CameraPosition(target: latLatPosition, zoom: 14);
    controllerChauffeur!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  var Mymarkers = HashSet<Marker>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(18.0735411, -15.9582337),
    zoom: 15.0,
  );

  //target: LatLng(37.42796133580664, -122.085749655962),

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
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            compassEnabled: true,
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            //onCameraMove: _onCameraMove,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controllerGoogleMaps.complete(controller);
              controllerChauffeur = controller;
              setState(() {
                Mymarkers.add(Marker(
                  markerId: const MarkerId("1"),
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueGreen,
                  ),
                  position: const LatLng(18.0735411, -15.9582337),
                ));
              });

              getPositionLocation();
            },
            initialCameraPosition: _kGooglePlex,
            markers: Mymarkers,
          ),

          /*
          Positioned(
            top: 50.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 5.0),
                      blurRadius: 10,
                      spreadRadius: 3)
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.name,
                controller: depart,

                cursorColor: Colors.black,
                //controller: appState.locationController,
                decoration: InputDecoration(
                  icon: Container(
                    margin: const EdgeInsets.only(left: 20, top: 5),
                    width: 10,
                    height: 10,
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Depart",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 15.0, top: 16.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 105.0,
            right: 15.0,
            left: 15.0,
            child: Container(

              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1.0, 5.0),
                      blurRadius: 10,
                      spreadRadius: 3)
                ],
              ),
              child: TextField(
                keyboardType: TextInputType.name,
                controller: destination,
                cursorColor: Colors.black,
                //controller: appState.destinationController,
                textInputAction: TextInputAction.go,
                onSubmitted: (value) {
                  // appState.sendRequest(value);
                },
                decoration: InputDecoration(
                  icon: Container(
                    margin: const EdgeInsets.only(left: 20, top: 5),
                    width: 10,
                    height: 10,
                    child: const Icon(
                      Icons.local_taxi,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Destination",
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 15.0, top: 16.0),
                ),
              ),
            ),
          ),
          */
          /*ajouter une marque dqns lq carte
          Positioned(
            top: 40,
            right: 10,
            child: FloatingActionButton(
              onPressed: _onMarkPressed,
              tooltip: "Ajoutez votre marque preferer",
              backgroundColor: Colors.black54,
              child: const Icon(
                Icons.add_location,
                color: Colors.white,
              ),
            ),
          ),
          */
        ],
      ),
      drawer: const NavigationDrawer(),
    );
  }

  // void _onCameraMove(CameraPosition position) {
  // setState(() {
  // _lastPosition = position.target;
  // });
  //}

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
              leading: const Icon(Icons.history_toggle_off_rounded),
              title: const Text("Historique"),
              onTap: () {
                //Navigator.pop(context);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HistoryPage()));
              },
            ),
            ListTile(
                leading: const Icon(Icons.people),
                title: const Text("Profil"),
                onTap: () {
                  //Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ProfilePage()));
                }),
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
                MaterialPageRoute(builder: (context) => const ProfilePage()));
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
