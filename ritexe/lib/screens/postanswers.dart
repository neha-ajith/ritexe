// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';

class PostAnswers extends StatefulWidget {
  const PostAnswers({Key? key}) : super(key: key);

  @override
  State<PostAnswers> createState() => _PostAnswersState();
}

class _PostAnswersState extends State<PostAnswers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Post your answer'),
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: Column(
          children: [
            Text(
                'local module descriptor class for com.google.android.gms.vision..dynamite not found',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            Divider(
              color: Colors.black,
              height: 40,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
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
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Your answer...'),
                ),
              ),
            ),
            SizedBox(height: 30.h),
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
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
