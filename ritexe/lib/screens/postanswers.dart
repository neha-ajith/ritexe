// ignore: unused_import
// ignore_for_file: unused_import

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:ritexe/screens/feed.dart';

import 'package:ritexe/screens/postanswers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

import '../widgets/sell_card.dart';

class PostAnswers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Post your answer'),
        backgroundColor: secondaryColor, // appbar color.
        foregroundColor: Colors.white,
        // appbar text color.
      ),

      /* title:Center(
              
              child: Container(
                
              ),
            ),*/
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
                'local module descriptor class for com.google.android.gms.vision..dynamite not found',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const Divider(
              color: Colors.black,
              height: 40,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            TextField(
              minLines: null,
              maxLines: null,
              expands: true,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 253, 252, 252),
                contentPadding: EdgeInsets.symmetric(vertical: 80.0),
                border: OutlineInputBorder(),
                hintText: 'Post your answer....',
                hintStyle: TextStyle(
                  fontSize: 20,
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                focusedBorder: OutlineInputBorder(
                  gapPadding: 0.0,
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
            ),
            SizedBox(height: 50),
            TextButton(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateProperty.all<Color>(secondaryColor),
              ),
              onPressed: () {},
              //  shape: new RoundedRectangleBorder(
              // borderRadius: new BorderRadius.circular(30.0),/  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              child: Text(
                "Post",
                style: TextStyle(
                  backgroundColor: secondaryColor,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
