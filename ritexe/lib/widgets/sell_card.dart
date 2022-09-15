// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/models/notifications.dart';

class SellCard extends StatefulWidget {
  final String title, qty, date, username, email;
  const SellCard(
      {Key? key,
      required this.title,
      required this.email,
      required this.qty,
      required this.date,
      required this.username})
      : super(key: key);

  @override
  State<SellCard> createState() => _SellCardState();
}

class _SellCardState extends State<SellCard> {
  Future notifySeller(Notifications notification) async {
    final Email email = Email(
      body:
          "Hello,\nJust saw your post, '${widget.title}' in Ritexe. I'm interested in your product. Please reach me out on this mail.\n\nBest,",
      subject: "Re: ${widget.title} on Ritexe",
      recipients: [widget.email],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Success!';
    } catch (error) {
      print(error);
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );

    await http.post(Uri.parse("http://10.0.2.2:8000/notifications/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'username': notification.username,
          'prodName': notification.prodName,
          'userId': notification.userId.toString()
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: GestureDetector(
        onTap: () {
          notifySeller(Notifications(prodName: widget.title, userId: userId));
        },
        child: Card(
          shape: const CircleBorder(),
          elevation: 1,
          child: Container(
              height: 120.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black,
                  ),
                  const BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 1.6),
                    blurRadius: 3,
                    spreadRadius: -3,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: const Color(0xff4D729E),
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                        ),
                        Text(
                          widget.date,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Qty: ${widget.qty}",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Posted by: ${widget.username}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                              color: Color.fromARGB(255, 104, 103, 103)),
                        ),
                        Text("Notify seller",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 77, 114, 158)))
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
