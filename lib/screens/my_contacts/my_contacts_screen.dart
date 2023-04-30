import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:tak_it_app/widgets/component.dart';

import '../../controllers/cubit/takit_cubit.dart';
import 'add_new_contact.dart';

class MyContactsScreen extends StatefulWidget {
  const MyContactsScreen({Key? key}) : super(key: key);

  @override
  State<MyContactsScreen> createState() => _MyContactsScreenState();
}

class _MyContactsScreenState extends State<MyContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakitCubit, TakitState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = TakitCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return AddNewContact();
                  }));
                },
                child: customsText('Ajouter un contact', Colors.white,
                    FontWeight.bold, 'intro', 17),
                height: 50,
                color: Colors.blue,
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: ConditionalBuilder(
                    condition: state is! LoadingGetDataFromContactState,
                    fallback: (BuildContext context) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    builder: (BuildContext context) {
                      return (cubit.contacts.isNotEmpty)
                          ? ListView.builder(
                              itemCount: cubit.contacts.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    leading: CircleAvatar(),
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cubit.contacts[index]['prenom'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold, fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(cubit.contacts[index]['numero']),
                                            Spacer(),
                                            Text(cubit.contacts[index]['fonction']),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          : Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.hourglass_empty),
                                    customsText(
                                        'Aucun contact enrégistré',
                                        Colors.red,
                                        FontWeight.normal,
                                        'intro',
                                        17)
                                  ]),
                            );
                    }),
              )
            ],
          )),
        );
      },
    );
  }
}
