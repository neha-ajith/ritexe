// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/sell_card.dart';

class Sell extends StatelessWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(children: [
          SellCard(
              title: "set square available", qty: "1", date: "15 June,2022"),
          SellCard(
              title: "set square available", qty: "1", date: "15 June,2022"),
          SellCard(
              title: "set square available", qty: "1", date: "15 June,2022"),
          SellCard(
              title: "set square available", qty: "1", date: "15 June,2022"),
          SellCard(
              title: "set square available", qty: "1", date: "15 June,2022")
        ]),
      ),
    );
  }
}

AppBar sellAppBar = AppBar(
  backgroundColor: secondaryColor,
  title: Center(
    child: Container(
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
      width: 250.w,
      height: 35.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Search...'),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);
