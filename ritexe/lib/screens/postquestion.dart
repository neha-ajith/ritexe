// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';

class PostQuestion extends StatelessWidget {
  const PostQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 20.h),
      child: Column(
        children: [
          SizedBox(height: 100.h),
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
            height: 50.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              child: TextField(
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
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
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

Text postQuestionAppBar = Text("Post a question");
