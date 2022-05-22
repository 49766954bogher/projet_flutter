import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoiteDeDialogue extends StatelessWidget {
  String? message;
  BoiteDeDialogue({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black54,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const SizedBox(width: 26),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                Text(
                  message!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
/*
      //Lors de l'épelation

      showDialog (
       context :context,
      barrierDismissible:false,
       builder: (BuildContext c) {

        return BoiteDeDialogue (message:'veuillez patientez...')
      }
       );


 */


