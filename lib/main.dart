import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smart_home_app/app_theme.dart';
import 'package:smart_home_app/camera_control.dart';
import 'package:smart_home_app/fan_control.dart';
import 'package:smart_home_app/status_page.dart';
import 'package:smart_home_app/light_control.dart';
import 'package:firebase_core/firebase_core.dart';

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
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: _fbapp,
        builder: (context, snapshot){
          if (snapshot.hasError){
            print('You have an error! ${snapshot.error.toString()}');
            return Text("Something went wrong");
          } else if (snapshot.hasData){
            return const SmartHomePage();
          } else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )
    );
  }
}

class SmartHomePage extends StatefulWidget {
  const SmartHomePage({Key? key}) : super(key: key);


  @override
  State<SmartHomePage> createState() => _SmartHomePageState();
}


class _SmartHomePageState extends State<SmartHomePage> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text ("Smart Home Automation"),
        centerTitle: true,
        backgroundColor: Colors.green[400],
        bottom:  const TabBar(
          isScrollable: true,
          tabs: [
            Tab(icon: Icon(Icons.loop_outlined), child: Text("Status Page")),
            Tab(icon: Icon(Icons.lightbulb_outline), child: Text("Light")),
            Tab(icon: Icon(Icons.support_outlined), child: Text("Fan")),
            Tab(icon: Icon(Icons.camera_alt), child: Text("Camera")),
          ],

        ),
      ),
      body: TabBarView(
        children: [
          const StatusPage(),
            const LightControl(),
            const FanControl(),
          const CameraControl(),

        ],
      ),
    )
    );
  }
  }


