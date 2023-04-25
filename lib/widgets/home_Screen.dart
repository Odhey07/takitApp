import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak_it_app/controllers/cubit/takit_cubit.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TakitCubit, TakitState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TakitCubit.get(context);
        return Scaffold(
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.contacts,
                  ),
                  label: 'Mes Contacts'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.qr_code,
                  ),
                  label: 'Ma Carte'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'Options'),
            ],

            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              cubit.changeBottomNavigationItem(index);
            },
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );
  }
}
