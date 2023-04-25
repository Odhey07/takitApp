import 'package:flutter/material.dart';
import 'package:tak_it_app/screens/my_qr_code/generate_qr.dart';

import '../../widgets/component.dart';

class NoCardScreen extends StatefulWidget {
  const NoCardScreen({Key? key}) : super(key: key);

  @override
  State<NoCardScreen> createState() => _NoCardScreenState();
}

class _NoCardScreenState extends State<NoCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: arrierePlan(),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Image.asset(
              "lib/assets/images/Logo_Takit.png",
              width: 250,
            ),
            SizedBox(
              height: 130,
            ),
            customsText('Pas encore de carte ?', Colors.white, FontWeight.normal, 'intro', 18),
            SizedBox(
              height: 40,
            ),
            //bouton pour creer ma carte
            ElevatedButton(
              onPressed: () {
                ///Generateur de QR code
                Navigator.push(context, MaterialPageRoute(builder:(BuildContext context){
                  return GenerateQrScreen();
                }));
              },
              child: customsText('Generer ma carte', Colors.white, FontWeight.normal, 'intro', 20),
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(45)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
