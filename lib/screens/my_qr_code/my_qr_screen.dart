import 'package:flutter/material.dart';
import 'package:tak_it_app/screens/my_qr_code/no_card.dart';

class MyQrScreen extends StatefulWidget {
  const MyQrScreen({Key? key}) : super(key: key);

  @override
  State<MyQrScreen> createState() => _MyQrScreenState();
}

class _MyQrScreenState extends State<MyQrScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NoCardScreen()
    );
  }
}
