import "Package:flutter/material.dart";

class ThemeSwitchIconButton extends StatefulWidget {
  const ThemeSwitchIconButton({Key? key}) : super(key: key);

  @override
  State<ThemeSwitchIconButton> createState() => _ThemeSwitchIconButtonState();
}

class _ThemeSwitchIconButtonState extends State<ThemeSwitchIconButton> {
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
