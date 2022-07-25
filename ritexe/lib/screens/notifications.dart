// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/notification_card.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(children: [
          NotificationCard(
              title: "you have a new buyer!", date: "15 Jun, 2022"),
          NotificationCard(
              title: "you have a new buyer!", date: "15 Jun, 2022"),
          NotificationCard(
              title: "you have a new buyer!", date: "15 Jun, 2022"),
          NotificationCard(title: "you have a new buyer!", date: "15 Jun, 2022")
        ]));
  }
}

AppBar notificationsAppBar = AppBar(
  backgroundColor: secondaryColor,
  title: Text("Notifications"),
);
