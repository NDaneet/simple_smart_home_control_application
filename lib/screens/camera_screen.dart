import "package:flutter/material.dart";
import "../components/components.dart";
import "package:webview_flutter/webview_flutter.dart";

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    controller.loadRequest(
        Uri.parse("https://flutter.dev"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
      child: 
       // children:  <Widget>[
         // SearchBarWidget(controller: controller),
        //  const SizedBox(height: 5),
          WebViewApp(controller: controller),
    );
  }
}

/* Container(
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
    );*/ 