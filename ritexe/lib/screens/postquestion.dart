// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ritexe/models/question.dart';

class PostQuestion extends StatefulWidget {
  const PostQuestion({Key? key}) : super(key: key);

  @override
  State<PostQuestion> createState() => _PostQuestionState();
}

Future saveQuestion(Question question) async {
  await http.post(Uri.parse("http://10.0.2.2:8000/questions/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'qs_title': question.qsTitle,
        'qs_desc': question.qsDescription,
        'date': DateTime.now().toString(),
        'user_id': "3"
      }));
}

class _PostQuestionState extends State<PostQuestion> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
      child: Form(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0, 1.6),
                    blurRadius: 1,
                    spreadRadius: -1,
                  ),
                ],
              ),
              width: double.infinity,
              height: 50.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Question Title',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0, 1.6),
                    blurRadius: 1,
                    spreadRadius: -1,
                  ),
                ],
              ),
              width: double.infinity,
              height: 180.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: TextField(
                  maxLines: 5,
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Question Description',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: const Offset(0, 1.6),
                    blurRadius: 1,
                    spreadRadius: -1,
                  ),
                ],
              ),
              width: double.infinity,
              height: 50.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Tags',
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  child: Text(
                    "Post",
                    style: TextStyle(fontSize: 20.sp),
                  )),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ))),
              onPressed: () {
                setState(() {
                  saveQuestion(Question(
                      qsTitle: titleController.text,
                      qsDescription: descriptionController.text));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

Text postQuestionAppBar = Text("Post a question");
