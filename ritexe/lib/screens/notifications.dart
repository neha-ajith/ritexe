// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/widgets/notification_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationsPage extends StatefulWidget {
  final int userId;
  const NotificationsPage({Key? key, required this.userId}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  Future fetchNotification() async {
    var notificationResponse = await http
        .get(Uri.parse("http://10.0.2.2:8000/notifications/${widget.userId}"));
    var questionThumbnails = [];

    var data = jsonDecode(notificationResponse.body);
    // for (var q in data) {
    //   questionThumbnails.add(Notifications(
    //     // prodName: q['prodName'],
    //     // userId:
    //   ));
    // }
    return questionThumbnails;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(children: [
          NotificationCard(username: "nea", prodName: "setsquare"),
          NotificationCard(username: "nea", prodName: "setsquare"),
          NotificationCard(username: "nea", prodName: "setsquare"),
        ]));
  }
}

Text notificationsAppBar = Text("Notifications");
