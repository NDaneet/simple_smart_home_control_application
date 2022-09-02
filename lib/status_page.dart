import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

// Class to create the FirstPage (StatusPage) that loads after authentication page
class StatusPage extends StatefulWidget{
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState()=> _StatusPageState();
}

class _StatusPageState extends State<StatusPage>{
  final _myDataBase = FirebaseDatabase.instance.ref();
  dynamic _fanText;
  dynamic _lightText;
  dynamic _pirText;
  dynamic _temperatureText;
  late StreamSubscription _fanStream;
  late StreamSubscription _lightStream;
  late StreamSubscription _pirStream;
  late StreamSubscription _tempStream;




  @override
  void initState(){
    super.initState();
    _activateListeners();
  }

  void _activateListeners (){
    _fanStream = _myDataBase.child('alert/f_alert').onValue.listen((event){
      final dynamic fanDescription = event.snapshot.value;
      setState(() {
        _fanText = fanDescription;
      });
    });
   _lightStream = _myDataBase.child('alert/l_alert').onValue.listen((event){
      final dynamic lightDescription = event.snapshot.value;
      setState(() {
        _lightText = lightDescription;
      });
    });
    _pirStream = _myDataBase.child('alert/pir_alert').onValue.listen((event){
      final dynamic pirDescription = event.snapshot.value;
      setState(() {
        _pirText = pirDescription;
      });
    });
   _tempStream = _myDataBase.child('alert/temperature').onValue.listen((event){
      final dynamic temperature = event.snapshot.value;
      setState(() {
        _temperatureText = temperature;
      });
    });
  }

  @override
  Widget build(BuildContext context){

    return Column(
        children: <Widget> [
        Container(
            margin: EdgeInsets.only(top:60.0),
            child: RichText(
              textAlign: TextAlign.center,
              maxLines: 6,
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(text: "Welcome to the Smart Home Automation Application by \n",
                        style: TextStyle(fontStyle: FontStyle.italic, fontSize: 23.0)),
                    TextSpan(text: "\n Akubueze Victor \n Nwakpu Ozias \n Nyorere Daniel",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0))
                  ]
            ),
            ),
        ),
          SizedBox(height: 80.0,),
          Container (
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Card(
                      child: Padding(
                        padding: EdgeInsets.only(top:10.0, bottom:10.0),
                        child: Align(
                            alignment:Alignment.centerLeft,
                            child:Column(
                          children: <Widget>[
                            Text(
                                "PIR Sensor: $_pirText \n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                )),
                            Text(
                                "Temperature: $_temperatureText",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                ))
                                ]
                            )
                                ),
                            ),
                    ),
                    Card(
                        child: Padding(
                            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child:Column(
                                children: <Widget>[
                                  Text(
                                      "Light Status: $_lightText \n",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      )),
                                  Text(
                                      "Fan Status: $_fanText",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      )),
                                ]

                            )
                        )
                    ),
                    ),
                  ]

              )
          )
        ]

    );
  }
  @override
  void deactivate(){
    _tempStream.cancel();
    _lightStream.cancel();
    _pirStream.cancel();
    _fanStream.cancel();
    super.deactivate();
  }
}