import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          style: Theme.of(context).textTheme.titleMedium,
          decoration: const InputDecoration(
            hintText: "Enter your email",
          ),
        ),
        const SizedBox(height: 10.0),
        TextFormField(
          style: Theme.of(context).textTheme.titleMedium,
          decoration: const InputDecoration(
            hintText: "Password",
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          style: Theme.of(context).textTheme.titleMedium,
          decoration: const InputDecoration(
            hintText: "Confirm password",
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        ElevatedButton(
          onPressed: () {},
          child:  const Text("Create Account"),
        )
      ],
    );
  }
}
