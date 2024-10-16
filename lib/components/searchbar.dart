import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key, required this.controller}) : super(key: key);
  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const SizedBox(width: 20),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: Colors.green[300],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15)),
          width: 200,
          height: 40,
          child:  const Text("Camera Settings and View", textAlign: TextAlign.center,),
        ),
       IconButton(
        splashColor: Colors.black12,
            onPressed: () {
              controller.reload();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
        
      ],
    );
  }
}
