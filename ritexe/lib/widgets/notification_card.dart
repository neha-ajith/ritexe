// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  final String username, prodName;
  // add date to notifications.
  const NotificationCard(
      {required this.username, required this.prodName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: Card(
            shape: const CircleBorder(),
            elevation: 1,
            child: Container(
                height: 100.h,
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
                          spreadRadius: -3)
                    ]),
                child: Padding(
                    padding: EdgeInsets.all(10.sp),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("you have a new buyer",
                                    style: TextStyle(
                                        color: const Color(0xff4D729E),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp)),
                                Text("12 Jun 2022",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp))
                              ]),
                          SizedBox(height: 10.h),
                          Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Text(
                                  "@$username is interested on your product, \"$prodName\". Check your registered email for more details.",
                                  style: TextStyle(fontSize: 14.sp)))
                        ])))));
  }
}
