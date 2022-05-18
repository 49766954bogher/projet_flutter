import 'dart:ffi';

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 80.0,
          ),
          Padding(
            padding: EdgeInsets.all(6.0),
            child: Image.asset("images/logo1.png"),
            //images/logo1.png
            // Image.network(
            //'https://www.bing.com/images/search?view=detailV2&ccid=zHBySLsk&id=14BB63FA7F30CD29973EC84CA8350266925F0509&thid=OIP.zHBySLsk-x8EDl-UvdIf7QHaGF&mediaurl=https%3A%2F%2Fimage.freepik.com%2Fvecteurs-libre%2Fheureux-personnage-souriant-chauffeur-taxi-invite-voyager-dans-son-illustration-dessin-anime-plat-voiture_133260-2221.jpg&cdnurl=https%3A%2F%2Fth.bing.com%2Fth%2Fid%2FR.cc707248bb24fb1f040e5f94bdd21fed%3Frik%3DCQVfkmYCNahMyA%26pid%3DImgRaw%26r%3D0&exph=515&expw=626&q=Chauffeur+De+Taxi+Dessin&simid=607996983790822871&form=IRPRST&ck=92A094C63E1B4A840AD7C42878A2796A&selectedindex=37&ajaxhist=0&ajaxserp=0&vt=0&sim=11'),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Le Chauffeur",
            style: TextStyle(
                fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: name,
            style: const TextStyle(
              color: Colors.grey,
            ),
            decoration: const InputDecoration(
                labelText: "Nom",
                hintText: "Nom",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
          TextField(
            controller: email,
            style: const TextStyle(
              color: Colors.grey,
            ),
            decoration: const InputDecoration(
                labelText: "Email",
                hintText: "email",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
          TextField(
            controller: phone,
            style: const TextStyle(
              color: Colors.grey,
            ),
            decoration: const InputDecoration(
                labelText: "Phone",
                hintText: "phone",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
          TextField(
            controller: password,
            style: const TextStyle(
              color: Colors.grey,
            ),
            decoration: const InputDecoration(
                labelText: "Mot de passe",
                hintText: "mot de passe",
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 18)),
          ),
        ]),
      ),
    );
  }
}
