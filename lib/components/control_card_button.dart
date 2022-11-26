import 'package:flutter/material.dart';

class ControlCard extends StatelessWidget {
  const ControlCard(
      {Key? key,
      required this.icon,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final Widget icon;
  final Color color;
  final Widget text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox.fromSize(
        size: const Size(70, 70),
        child: Material(
          color: Colors.white,
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon, text],
            ),
            onTap: onPressed,
            splashColor: color,
          ),
        ),
      ),
    );
  }
}
