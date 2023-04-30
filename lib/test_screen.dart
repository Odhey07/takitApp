import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tak_it_app/widgets/component.dart';

class test_screen extends StatefulWidget {
  const test_screen({Key? key}) : super(key: key);

  @override
  State<test_screen> createState() => _test_screenState();
}

class _test_screenState extends State<test_screen> {


  final GlobalKey _globalKey = GlobalKey();
  QRViewController? controller;
  Barcode ? result;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            PrettyQr(data: 'test du Qr code', size: 150),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.add),
                labelText: 'Ceci est un test',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
              ),
              keyboardType: TextInputType.text,
            ),

            Container(
              height: 300,
              width: 300,
              child: QRView(
                  key: _globalKey,
                  onQRViewCreated: (QRViewController controller) {
                    this.controller = controller;
                    controller.scannedDataStream.listen((event) {
                      setState(() {
                        result = event;

                      });
                    });
                  }),
            ),
            (result !=null) ? Text('${result!.code}') : Text('Scanner'),

          ],
        ),
      ),
    );
  }
}
