import "package:flutter/material.dart";
import "../form/sign_up.dart";

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left:10.0, right:10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SignUpForm(),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Have an Account?",
              style: TextStyle(color: Colors.green[800], fontSize: 17),
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
