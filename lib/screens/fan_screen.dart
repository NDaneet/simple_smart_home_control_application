import "package:flutter/material.dart";
import 'package:firebase_database/firebase_database.dart';
import '../components/components.dart';

class FanScreen extends StatefulWidget {
  const FanScreen({Key? key}) : super(key: key);

  @override
  State<FanScreen> createState() => _FanScreenState();
}

class _FanScreenState extends State<FanScreen> {
  final _fanDatabase = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    final _componentsRef = _fanDatabase.child('components/');
    final _alertRef = _fanDatabase.child('alert/');
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const ImageContainer(
            imageProvider: AssetImage("assests/fan_image.jpeg"),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ControlCard(
                icon: Icon(
                  Icons.support_rounded,
                  color: Colors.green[700],
                ),
                color: Colors.green.withOpacity(0.3),
                text: Text(
                  "ON",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
                onPressed: () async {
                  try {
                    await _componentsRef.update({'fan': 1});
                    await _alertRef.update({'f_alert': "ON"});
                  } catch (e) {
                    debugPrint('You got an $e');
                  }
                },
              ),
              const SizedBox(
                width: 10,
              ),
              ControlCard(
                icon: Icon(
                  Icons.support_rounded,
                  color: Colors.red[700],
                ),
                color: Colors.red.withOpacity(0.3),
                text: Text(
                  "OFF",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
                onPressed: () async {
                  try {
                    await _componentsRef.update({'fan': 0});
                    await _alertRef.update({'f_alert': "OFF"});
                  } catch (e) {
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
                      .bodyMedium
                      ?.copyWith(color: Colors.black),
                ),
                onPressed: () {
                  showDialog<void>(
                    context: context,
                    builder: (context) {
                      return const MicrophoneDialog();
                    },
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
