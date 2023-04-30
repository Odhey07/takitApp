import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak_it_app/controllers/cubit/takit_cubit.dart';
import 'package:tak_it_app/screens/my_qr_code/no_card.dart';
import 'package:tak_it_app/screens/my_qr_code/qr_generated.dart';

class MyQrScreen extends StatefulWidget {
  const MyQrScreen({Key? key}) : super(key: key);

  @override
  State<MyQrScreen> createState() => _MyQrScreenState();
}

class _MyQrScreenState extends State<MyQrScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakitCubit, TakitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = TakitCubit.get(context);
        return Scaffold(
            body: cubit.cartes.isEmpty ? NoCardScreen() : QrGenerated()
        );
      },
    );
  }
}
