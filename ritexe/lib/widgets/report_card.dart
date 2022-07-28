// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportCard extends StatelessWidget {
  final String title, date, username;
  
  var report;
 const ReportCard(
      {Key? key,
      required this.title,
      required this.date,
      required this.username})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
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
                          title,
                          style: TextStyle(
                              color: const Color(0xff4D729E),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                        ),
                      ),
                      Text(
                        date,
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
                    "Posted by: $username",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Color.fromARGB(255, 104, 103, 103)),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
