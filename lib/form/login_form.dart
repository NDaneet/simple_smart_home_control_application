import "package:flutter/material.dart";

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
            style: Theme.of(context).textTheme.subtitle1,
            decoration: const InputDecoration(
              hintText: "Username",
            )),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
            obscureText: true,
            style: Theme.of(context).textTheme.subtitle1,
            decoration: const InputDecoration(
              hintText: "Password",
            )),
        const SizedBox(height: 15.0),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Log In"),
        ),
      ],
    );
  }
}
