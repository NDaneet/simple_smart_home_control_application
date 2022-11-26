import "package:flutter/material.dart";

class StatusCard extends StatelessWidget {
  const StatusCard({
    Key? key,
    required this.firstTextValue,
    required this.secondTextValue,
  }) : super(key: key);

  final Widget firstTextValue;
  final Widget secondTextValue;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10.0,
      child: SizedBox(
        width: 100.0,
        height: 70.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 5.0,
              ),
              firstTextValue,
              const SizedBox(
                height: 5.0,
              ),
              secondTextValue
            ],
          ),
        ),
      ),
    );
  }
}
