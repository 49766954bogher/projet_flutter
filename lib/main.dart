import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taxido/EcranDemarage/splash_screen.dart';
import 'package:taxido/EcranPrincipal/main_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MyApp(
      child: MaterialApp(
        title: "Taxido",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MySplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
  /*git
   AnimatedSplashScreen(
          backgroundColor: Colors.black,
          splash: 'images/driver.jpg',
          nextScreen: MainScreen(),
          splashTransition: SplashTransition.scaleTransition,
        ),*/
}

// Using last version avec nulSafety
class MyApp extends StatefulWidget {
  final Widget? child;

  MyApp({this.child});
// La methode qui va etr appeler dans n'importe quel place pour redemarer lapp
  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }



  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}
