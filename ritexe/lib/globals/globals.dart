import 'package:flutter/material.dart';

BoxDecoration backgroundImage = const BoxDecoration(
  color: Colors.white,
  image: DecorationImage(
    image: AssetImage("assets/bg.png"),
    fit: BoxFit.cover,
  ),
);

Color primaryColor = const Color(0xff8D9EB2);
Color secondaryColor = const Color(0xff3E3E3E);
int userId = 15;
String username = "";
