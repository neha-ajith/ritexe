// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ritexe/globals/globals.dart';
// ignore: unused_import
import 'package:ritexe/models/report.dart';

import 'package:http/http.dart' as http;

import '../widgets/report_card.dart';
import '../widgets/sell_card.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: Text("Reported answers"),
          leading: BackButton(color: Colors.white),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                child: Column(
                  children: [
                    Column(children: [
                      Text("snapshot.data.qsTitle",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Posted: 18 Jun '22",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Container(
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
                          padding: EdgeInsets.all(10.sp),
                          child: Text(
                            "snapshot.data.qsDescription",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                              fontFamily: 'sans-serif-light',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0),
                    ]),

                    //  Column(
                    //           children: [
                    //             Row(children: [
                    //               Text("4 Answers",
                    //                   style: TextStyle(
                    //                       fontWeight: FontWeight.bold,
                    //                       fontSize: 16.sp)),
                    //             ]),
                    //             SizedBox(height: 10.h),

                    //           ],
                    //         ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
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
                        padding: EdgeInsets.all(10.sp),
                        child: Text(
                          "answer",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp,
                            fontFamily: 'sans-serif-light',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(width: 75.h),
                  ElevatedButton(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                        child: Text(
                          "Delete",
                          style: TextStyle(fontSize: 15.sp),
                        )),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(secondaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ))),
                    onPressed: () {},
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(2, 5, 2, 5),
                        child: Text(
                          "Ignore this",
                          style: TextStyle(fontSize: 15.sp),
                        )),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(secondaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ))),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
