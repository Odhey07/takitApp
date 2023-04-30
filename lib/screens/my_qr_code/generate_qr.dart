import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak_it_app/controllers/cubit/takit_cubit.dart';
import 'package:tak_it_app/screens/my_qr_code/qr_generated.dart';
import 'package:tak_it_app/widgets/component.dart';

import '../../widgets/style/theme.dart';

class GenerateQrScreen extends StatefulWidget {
  const GenerateQrScreen({Key? key}) : super(key: key);

  @override
  State<GenerateQrScreen> createState() => _GenerateQrScreenState();
}

class _GenerateQrScreenState extends State<GenerateQrScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController functionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakitCubit, TakitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TakitCubit.get(context);
        return Scaffold(
          appBar: AppBar(title: Text('Création de Carte'), titleSpacing: 75),
          body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 30),
                  child: Column(
                    children: [
                      customsText('Generer ma Carte', bleuf, FontWeight.bold,
                          'intro', 25),
                      SizedBox(
                        height: 40,
                      ),
                      CustomTextFormField(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer votre nom svp';
                            }
                          },
                          prefixIcon: Icon(Icons.account_circle),
                          label: 'Veuillez entrer votre nom'),
                      SizedBox(
                        height: 25,
                      ),
                      CustomTextFormField(
                          controller: surnameController,
                          keyboardType: TextInputType.text,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer votre prenom svp';
                            }
                          },
                          prefixIcon: Icon(Icons.account_circle),
                          label: 'Veuillez entrer votre prénom'),
                      SizedBox(
                        height: 25,
                      ),
                      CustomTextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer votre adresse mail svp';
                            }
                          },
                          prefixIcon: Icon(Icons.mail),
                          label: 'Veuillez entrer adresse mail'),
                      SizedBox(
                        height: 25,
                      ),
                      CustomTextFormField(
                          controller: functionController,
                          keyboardType: TextInputType.text,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer votre fonction svp';
                            }
                          },
                          prefixIcon: Icon(Icons.work),
                          label: 'Veuillez entrer votre fonction'),
                      SizedBox(
                        height: 25,
                      ),
                      CustomTextFormField(
                          controller: numController,
                          keyboardType: TextInputType.text,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Veuillez entrer votre numero de telephone svp';
                            }
                          },
                          prefixIcon: Icon(Icons.phone),
                          label: 'Veuillez entrer votre numero de telephone'),
                      SizedBox(
                        height: 25,
                      ),
                      MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            cubit.insertDataToCarte(
                              nom: nameController.text,
                              prenom: surnameController.text,
                              mail: emailController.text,
                              fonction: functionController.text,
                              numero: numController.text,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return QrGenerated();
                              }),
                            );
                          }
                        },
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: bleuf,
                        child: customsText('Generer ma carte', Colors.white,
                            FontWeight.normal, 'intro', 20),
                      )
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
