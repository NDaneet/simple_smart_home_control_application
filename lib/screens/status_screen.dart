import "package:flutter/material.dart";
import 'dart:async';
import '../components/darktheme_iconbutton.dart';
import "../components/components.dart";
import 'package:firebase_database/firebase_database.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, right:10.0, top: 30.0),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Smart Home Application by",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(fontSize: 20.0),
              ),
              const ThemeSwitchIconButton(),
            ],
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Nwakpu Ozias \nNyorere Daniel",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          const SizedBox(height: 30.0),
          const SizedBox(
            height: 400,
            child: ImageContainer(
              imageProvider: AssetImage("assests/smart_home.jpeg"),
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StatusCard(
                firstTextValue: Text(
                  "PIR: ${_pirText ?? "Loading..."}",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                secondTextValue: Text(
                  "Temp: ${_temperatureText ?? 0}\u2103",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              StatusCard(
                firstTextValue: Text(
                  "Light: ${_lightText?? "Loading..."}",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                secondTextValue: Text(
                  "Fan: ${_fanText ?? "Loading..."}",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
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
