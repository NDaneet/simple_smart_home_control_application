import 'dart:async';
import 'package:flutter/material.dart';

class CameraControl extends StatefulWidget{
  const CameraControl({Key? key}) : super (key: key);


  @override
  State<CameraControl> createState() => _CameraControlState();

}

class _CameraControlState extends State<CameraControl>{

  @override
  Widget build(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextButton(
            onPressed: (){},
            style: TextButton.styleFrom(primary: Colors.black87),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.camera_alt, size: 77),
                Text("Camera View"),
              ],
            )
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(onPressed: (){},
                  style: TextButton.styleFrom(primary: Colors.green),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.door_front_door_outlined, size: 77),
                        Text("Door Open"),
                      ]
                  )
              ),
              TextButton(onPressed: (){},
                  style: TextButton.styleFrom(primary: Colors.red),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Icon(Icons.door_front_door_outlined, size: 77),
                        Text("Door Close"),
                      ]
                  )
              )
            ]
        )

      ],
    );
  }
}