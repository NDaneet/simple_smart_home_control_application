import 'dart:async';
import 'package:flutter/material.dart';
import 'general_theme.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SmartHomeApp());
}

class SmartHomeApp extends StatelessWidget {
   SmartHomeApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _fbapp = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Home Application',
      theme: GeneralTheme.light(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => FutureBuilder(
        future: _fbapp,
        builder: (context, snapshot){
          if (snapshot.hasError){
            return const Text("Something went wrong");
          } else if (snapshot.hasData){
            return const LoginScreen();
          } else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      '/home': (context) => const Home(),
      '/signup':(context) => const SignUpScreen(),
      }
    );
  }
}

