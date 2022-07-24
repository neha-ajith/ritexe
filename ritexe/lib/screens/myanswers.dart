// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

class MyAnswers extends StatefulWidget {
  const MyAnswers({Key? key}) : super(key: key);

  @override
  State<MyAnswers> createState() => _MyAnswersState();
}

class _MyAnswersState extends State<MyAnswers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text("My Answers"),
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            QuestionCard(title: "reupload", noOfAnswers: "4"),
            QuestionCard(title: "reupload", noOfAnswers: "2"),
            QuestionCard(title: "reupload", noOfAnswers: "1"),
            QuestionCard(title: "reupload", noOfAnswers: "3")
          ],
        ),
      ),
    );
  }
}
