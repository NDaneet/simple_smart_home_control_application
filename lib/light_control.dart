import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class LightControl extends StatefulWidget{
  const LightControl({Key? key}) : super(key: key);

  @override
  State<LightControl> createState() =>  _LightControlState();


}

class _LightControlState extends State<LightControl> {
  final _lightDatabase = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {

    final _componentsRef = _lightDatabase.child('components/');
    final _alertRef = _lightDatabase.child('alert/');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () async{
                try {
                  await _componentsRef.update({'light': 1});
                  await _alertRef.update({'l_alert': "ON LIGHT TEST"});
                } catch (e){
                  print('You got an $e');
                }
              },
              style: TextButton.styleFrom(primary: Colors.green),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.lightbulb_outline, size: 77),
                  Text("ON")
                ],
              ),
            ),
            TextButton(
              onPressed: () async{
                try {
                  await _componentsRef.update({'light': 0});
                  await _alertRef.update({'l_alert': "OFF LIGHT TEST"});
                } catch (e){
                  print('You got an $e');
                }
              },
              style: TextButton.styleFrom(primary: Colors.red),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.lightbulb_outline, size: 77),
                  Text("OFF")
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: (){},
                style: TextButton.styleFrom(primary: Colors.blue),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.keyboard_voice_outlined, size: 60),
                    Text("Voice Command")
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}