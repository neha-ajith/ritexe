import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Card(
        shape: CircleBorder(),
        elevation: 1,
        child: Container(
            height: 100.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                ),
                BoxShadow(
                  color: Colors.black,
                  offset: const Offset(0, 1.6),
                  blurRadius: 3,
                  spreadRadius: -3,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(10.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "reupload the type=file once uploaded till submit",
                    style: TextStyle(
                        color: Color(0xff4D729E),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                  Text(
                    "2 answers",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
