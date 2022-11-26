import "package:flutter/material.dart";
import "../components/components.dart";

class CameraScreen extends StatelessWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CameraContainer(),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ControlCard(
                icon: Icon(
                  Icons.door_front_door,
                  color: Colors.green[700],
                ),
                color: Colors.green.withOpacity(0.3),
                text: Text(
                  "Open",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.black),
                ),
                onPressed: (){},
              ),
              const SizedBox(
                width: 10,
              ),
              ControlCard(
                icon: Icon(
                  Icons.door_front_door,
                  color: Colors.red[700],
                ),
                color: Colors.red.withOpacity(0.3),
                text: Text(
                  "Close",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.black),
                ),
                onPressed: (){}
              ),
            ],
          )
        ],
      ),
    );
  }
}
