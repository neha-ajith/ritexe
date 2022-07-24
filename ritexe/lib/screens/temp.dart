import 'package:flutter/material.dart';

import 'package:ritexe/screens/feed.dart';

import 'package:ritexe/screens/sell.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

class Sell extends StatelessWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //        title: Text('search item'),
        backgroundColor: secondaryColor,
        title: Container(
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
        // body:Padding()
        // child: Column(
        //   children:[
        //     QuestionCard(title: "set square available", noOfAnswers: noOfAnswers)
        //   ]
        // )
      ),
      //    body: Center(
      //       child: Text('Hello World'),

      //  ),
    );
  }
}
