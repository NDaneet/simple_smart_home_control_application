import "Package:flutter/material.dart";

class ThemeSwicthIconButton extends StatefulWidget {
  const ThemeSwicthIconButton({Key? key}) : super(key: key);

  @override
  State<ThemeSwicthIconButton> createState() => _ThemeSwicthIconButtonState();
}

class _ThemeSwicthIconButtonState extends State<ThemeSwicthIconButton> {
  bool onClick = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: IconButton(
        onPressed: () {
          setState(() {
            onClick = !onClick;
          });
        },
        icon: onClick? const Icon(
          Icons.light_mode_rounded,
        ) : const Icon(Icons.dark_mode_rounded
      ),
      )
    );
  }
}
