// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ritexe/globals.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(children: [
            Image.asset("assets/logo.png"),
            Text(
              "Sign Up",
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: 'Roboto',
                  color: Colors.white),
            )
          ]),
        ),
        decoration: backgroundImage);
  }
}
