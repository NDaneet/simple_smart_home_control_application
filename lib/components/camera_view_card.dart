import 'package:flutter/material.dart';

class CameraContainer extends StatelessWidget {
  const CameraContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration:const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        );
  }
}
