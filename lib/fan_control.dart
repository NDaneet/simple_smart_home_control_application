import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FanControl extends StatefulWidget{
  const FanControl({Key? key}) : super(key: key);

  @override
  State<FanControl> createState() =>  _FanControlState();


}

class _FanControlState extends State<FanControl> {
  final _fanDatabase = FirebaseDatabase.instance.ref();



  @override
  Widget build(BuildContext context) {
    final _componentsRef = _fanDatabase.child('components/');
    final _alertRef = _fanDatabase.child('alert/');
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () async {
                  try {
                    await _componentsRef.update({'fan': 1});
                    await _alertRef.update({'f_alert': "ON FAN TEST"});
                  } catch (e){
                    print('You got an $e');
                  }
                },
                style: TextButton.styleFrom(primary: Colors.green),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.support_outlined, size: 77),
                    Text("ON")
                  ],
                ),
              ),
              TextButton(
                onPressed: () async{
                  try {
                    await _componentsRef.update({'fan': 0});
                    await _alertRef.update({'f_alert': "OFF FAN TEST"});
                  } catch (e){
                    print('You got an $e');
                  }
                },
                style: TextButton.styleFrom(primary: Colors.red),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.support_outlined, size: 77),
                    Text("OFF")
                  ],
                ),
              ),
              TextButton(
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
            ],
          )
        ]
    );
  }
}
