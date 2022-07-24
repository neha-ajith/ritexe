// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationCard extends StatelessWidget {
  final String title, date;
  const NotificationCard({required this.title, required this.date, Key? key})
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
                                Text(title,
                                    style: TextStyle(
                                        color: const Color(0xff4D729E),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp)),
                                Text(date,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp))
                              ]),
                          SizedBox(height: 10.h),
                          Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Text(
                                  "Someone is interested on your product. Check your registered email for more details.",
                                  style: TextStyle(fontSize: 14.sp)))
                        ])))));
  }
}
