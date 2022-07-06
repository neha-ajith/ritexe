// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';

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
          padding: EdgeInsets.all(20.sp),
          child: Column(children: [
            Image.asset(
              "assets/logo.png",
              height: 45.h,
            ),
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
