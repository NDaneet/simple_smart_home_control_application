import "package:flutter/material.dart";
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:firebase_database/firebase_database.dart';

class MicrophoneDialog extends StatefulWidget {
  const MicrophoneDialog({Key? key}) : super(key: key);

  @override
  State<MicrophoneDialog> createState() => _MicrophoneDialogState();
}

class _MicrophoneDialogState extends State<MicrophoneDialog> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = "";
  final _allDatabase = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize(debugLogging: true);
    setState(() {});
  }

  void _startListening() async {
    _lastWords = "";
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    debugPrint(_lastWords);
    await _speechToText.stop();
    setState(() {});
    _firebaseControl();
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(
      () {
        _lastWords = result.recognizedWords;
      },
    );
  }

  void _firebaseControl() async {
    String gottenWords = _lastWords.trim();
    final _componentsRef = _allDatabase.child('components/');
    final _alertRef = _allDatabase.child('alert/');
    /*if (gottenWords == "fun on"){
      await _componentsRef.update({'fan': 1});
      await _alertRef.update({'f_alert': "ON"});
      return "Done";
    }
    return "Not Done";
    */
    switch (gottenWords) {
      case "fun on":
      case "fan on":
        {
          try {
            await _componentsRef.update({'fan': 1});
            await _alertRef.update({'f_alert': "ON"});
          } catch (e) {
            debugPrint('You got an $e');
          }
        }
        break;
      case "fun off":
      case "fan off":
        {
          try {
            await _componentsRef.update({'fan': 0});
            await _alertRef.update({'f_alert': "OFF"});
          } catch (e) {
            debugPrint('You got an $e');
          }
        }
        break;
      case "lights on":
        {
          try {
            await _componentsRef.update({'light': 1});
            await _alertRef.update({'l_alert': "ON"});
          } catch (e) {
            debugPrint('You got an $e');
          }
        }
        break;
      case "lights off":
        {
          try {
            await _componentsRef.update({'light': 0});
            await _alertRef.update({'l_alert': "OFF"});
          } catch (e) {
            debugPrint('You got an $e');
          }
        }
        break;
      default:
        {
          debugPrint("Nothing occured");
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        height: MediaQuery.of(context).size.height / 2.5,
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Voice Control",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              child: _speechToText.isNotListening
                  ? const Icon(
                      Icons.mic,
                      size: 50,
                    )
                  : const Icon(
                      Icons.mic_off,
                      size: 50,
                    ),
              onPressed: _speechToText.isNotListening
                  ? _startListening
                  : _stopListening,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              _speechToText.isListening
                  ? _lastWords
                  : _speechEnabled
                      ? "Try saying something"
                      : "Didn't catch that. Try speaking again.",
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
            _speechToText.isListening
                ? const SizedBox()
                : OutlinedButton(
                    child: const Text("Try Again"),
                    style: OutlinedButton.styleFrom(
                      onSurface: Colors.blue,
                      textStyle: const TextStyle(fontSize: 12),
                    ),
                    onPressed: () {}),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
