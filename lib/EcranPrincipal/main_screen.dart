import 'package:flutter/material.dart';
import 'package:taxido/Pages/accueil.dart';
import 'package:taxido/Pages/note.dart';
import 'package:taxido/Pages/paiement.dart';
import 'package:taxido/Pages/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  onSItemclick(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {

    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(

        body:  TabBarView(


          physics: NeverScrollableScrollPhysics(),
          controller: tabController,
          children: const [

            HomePage(),
            PaiementPage(),
            NotePage(),
            ProfilePage()
          ],

        ),


        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.credit_card),
              label: 'Paiement',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Note',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),

          ],
          unselectedItemColor: Colors.white54,
          selectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
          ),
          showSelectedLabels: true,
          currentIndex: selectedIndex,
          onTap: onSItemclick,
        ),



    );
  }

  ElevatedButton SortirApp(){
    return   ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => MainScreen()));
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.lightGreenAccent,
      ),
      child: const Text(
        "sortir",
        style: TextStyle(
          fontSize: 18,
          color: Colors.white54,
        ),
      ),
    );
  }
}
