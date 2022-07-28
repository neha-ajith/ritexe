// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ritexe/globals/globals.dart';
// ignore: unused_import
import 'package:ritexe/models/similarquestions.dart';

import 'package:http/http.dart' as http;

import '../widgets/question_card.dart';
import '../widgets/report_card.dart';
import '../widgets/sell_card.dart';

class SimilarQuestions extends StatefulWidget {
  const SimilarQuestions({Key? key}) : super(key: key);

  @override
  State<SimilarQuestions> createState() => _ReportState();
}

class _ReportState extends State<SimilarQuestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: Text("Similar questions found"),
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
                      QuestionCard(
                          title: "snapshot.data[index].title",
                          noOfAnswers: " 2 "),
                      QuestionCard(
                          title: "snapshot.data[index].title",
                          noOfAnswers: " 2 "),
                      QuestionCard(
                          title: "snapshot.data[index].title",
                          noOfAnswers: " 3 "),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Are you sure you want to post?",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(4, 7, 4, 7),
                        child: Text(
                          "Post Anyway",
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
