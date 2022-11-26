import "package:flutter/material.dart";
import '../components/components.dart';
import 'package:firebase_database/firebase_database.dart';

class LightScreen extends StatefulWidget {
  const LightScreen({ Key? key }) : super(key: key);

  @override
  State<LightScreen> createState() => _LightScreenState();
}

class _LightScreenState extends State<LightScreen> {
  final _lightDatabase = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    final _componentsRef = _lightDatabase.child('components/');
    final _alertRef = _lightDatabase.child('alert/');
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const ImageContainer(imageProvider: AssetImage("assets/light_image.jpeg"),),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ControlCard(
                icon: Icon(
                  Icons.lightbulb,
                  color: Colors.green[700],
                ),
                color: Colors.green.withOpacity(0.3),
                text: Text(
                  "ON",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.black),
                ),
                onPressed: ()async{
                try {
                  await _componentsRef.update({'light': 1});
                  await _alertRef.update({'l_alert': "ON"});
                } catch (e){
                  debugPrint('You got an $e');
                }
              },
              ),
              const SizedBox(
                width: 10,
              ),
              ControlCard(
                icon: Icon(
                  Icons.lightbulb,
                  color: Colors.red[700],
                ),
                color: Colors.red.withOpacity(0.3),
                text: Text(
                  "OFF",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.black),
                ),
                onPressed: ()async{
                try {
                  await _componentsRef.update({'light': 0});
                  await _alertRef.update({'l_alert': "OFF"});
                } catch (e){
                  debugPrint('You got an $e');
                }
              },
              ),
              const SizedBox(
                width: 10,
              ),
              ControlCard(
                icon: Icon(
                  Icons.mic_none_rounded,
                  color: Colors.blue[700],
                ),
                color: Colors.blue.withOpacity(0.3),
                text: Text(
                  "Voice",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.black),
                ),
                onPressed: (){
                   showDialog<void>(
                        context: context,
                        builder: (context) {
                          return const MicrophoneDialog();
                        });
                }
              ),
            ],
          )
        ],
      ),
    );
  }
}