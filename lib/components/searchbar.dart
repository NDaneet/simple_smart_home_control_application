import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key? key, required this.controller}) : super(key: key);
  final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15)),
        width: size - 10,
        height: 20,
        child: Stack(
          children: <Widget>[
            const Text("Camera Settings and View"),
            const SizedBox(width: 5),
            Positioned(
              left: size-15,
              child: IconButton(
                onPressed: () {
                  controller.reload();
                },
                icon: const Icon(
                  Icons.refresh,
                ),
              ),
            )
          ],
        ));
  }
}
