import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tak_it_app/controllers/cubit/takit_cubit.dart';

import '../../widgets/component.dart';

class AddNewContact extends StatefulWidget {
  const AddNewContact({Key? key}) : super(key: key);

  @override
  State<AddNewContact> createState() => _AddNewContactState();
}

class _AddNewContactState extends State<AddNewContact> {
  final GlobalKey _globalKey = GlobalKey();
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakitCubit, TakitState>(
      listener: (context, state) {
        if (state is InsertingDataToContacSuccestState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = TakitCubit.get(context);
        Barcode? result = cubit.result;
        return Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    child: QRView(
                        key: _globalKey,
                        onQRViewCreated: (controller) {
                          this.controller = controller;
                          controller.scannedDataStream.listen((event) {
                            cubit.changeQrValue(
                              event,
                            );
                            Navigator.pop(context);
                          });
                        }),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  (result != null) ? Text('${result.code}') : Text('Scanner'),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: customsText(
                        'Annuler', Colors.white, FontWeight.bold, 'intro', 17),
                    height: 50,
                    color: Colors.red,
                  )
                ],
              )),
        );
      },
    );
  }
}
