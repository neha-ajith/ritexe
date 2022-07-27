// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerCard extends StatelessWidget {
  final String ans;
  const AnswerCard({
    required this.ans,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Container(
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
            ans,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              fontFamily: 'sans-serif-light',
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
