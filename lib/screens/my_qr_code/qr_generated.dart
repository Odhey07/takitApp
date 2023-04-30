import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:tak_it_app/widgets/component.dart';

import '../../controllers/cubit/takit_cubit.dart';

class QrGenerated extends StatefulWidget {
  const QrGenerated({Key? key}) : super(key: key);

  @override
  State<QrGenerated> createState() => _QrGeneratedState();
}

class _QrGeneratedState extends State<QrGenerated> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakitCubit, TakitState>(
      listener: (BuildContext context, state) {},
      builder: (context, state) {
        var cubit = TakitCubit.get(context);
        return Scaffold(
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 250,
                ),
                PrettyQr(
                  data:
                      cubit.cartes[0]['id'].toString(),
                  size: 200,
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  onPressed: () {},
                  child: customsText('Modifier ma carte', Colors.white,
                      FontWeight.bold, 'intro', 17),
                  height: 50,
                  color: Colors.lightBlue,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
