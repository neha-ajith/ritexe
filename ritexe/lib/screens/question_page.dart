// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';

class QuestionPage extends StatelessWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Questions'),
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
        child: Column(
          children: [
            Text(
                'local module descriptor class for com.google.android.gms.vision..dynamite not found',
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
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
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
                  "I'm new at Google Mobile Vision api and I've been using barcode detector class to detect barcodes. The app works fine but it does not work in my android 4.2.2 phone. I've updated the play services to v10.0.1 but still no good. When connected to android studio with debugger I get the message: 'local module descriptor class for com.google.android.gms.vision.dynamite not found'. I've tried the app in other android 4.2.2 device. It works, but for some reason it doesn't work in mine. Can anyone help me with the above error? Some libraries I'm missing perhaps?",
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
            Divider(color: Colors.black, thickness: 1, indent: 0, endIndent: 0),
            Row(
              children: [
                Text("2 Answers",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.sp)),
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
                  "for me, the device doesn't have google-play-service. I just download (google-play-service) from Google Play Store and update software. (oppo)",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    fontFamily: 'sans-serif-light',
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
