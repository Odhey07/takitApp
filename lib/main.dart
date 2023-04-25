import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tak_it_app/controllers/cubit/takit_cubit.dart';
import 'package:tak_it_app/test_screen.dart';
import 'package:tak_it_app/widgets/home_Screen.dart';
import 'package:tak_it_app/widgets/style/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TakitCubit()..createDatabase()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Takit-it App',
        theme: takitTheme,
        home: AnimatedSplashScreen(
          duration: 3000,
          splashIconSize: double.infinity,
          splash: Image.asset('lib/assets/images/Plan_bg_app_rouge.png',
              fit: BoxFit.cover),
          nextScreen: HomeScreen(),
        ),
      ),
    );
  }
}
