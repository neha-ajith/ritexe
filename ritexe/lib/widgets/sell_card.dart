// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SellCard extends StatelessWidget {
  final String title, qty,date;
  const SellCard({required this.title, required this.qty, required this.date});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Card(
        shape: const CircleBorder(),
        elevation: 1,
        child: Container(
            height: 100.h,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: const Color(0xff4D729E),
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Qty: $qty",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                      Text(
                        "$date",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.sp),
                      ),
                      
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
