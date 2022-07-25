// ignore: unused_import
// ignore_for_file: unused_import, unnecessary_new

import 'package:flutter/material.dart';

import 'package:ritexe/screens/feed.dart';

import 'package:ritexe/screens/questions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

import '../widgets/sell_card.dart';

class Questions123 extends StatelessWidget {
  const Questions123({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Questions'),
        backgroundColor: secondaryColor, // appbar color.
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          // icon:Image.asset("assets/edit.png",
          //                  fit: BoxFit.fill,),
          onPressed: () {},
        ),
      ),
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          SizedBox(height: 30),
          Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text(
                  "local module descriptor class for com.google.android.gms.vision.dynamite not found",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'sans-serif-light',
                    color: Colors.white,
                  )),
            ],
          ),
          Text(
              'local module descriptor class for com.google.android.gms.vision..dynamite not found',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text(
            "Posted :18 Jun '22",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              fontFamily: 'sans-serif-light',
              color: Colors.black,
            ),
          ),
          Card(
              shape: const CircleBorder(),
              elevation: 1,
              child: Container(
                height: 250.h,
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
                        "I'm new at Google Mobile Vision api and I've been using barcode detector class to detect barcodes. The app works fine but it does not work in my android 4.2.2 phone. I've updated the play services to v10.0.1 but still no good. When connected to android studio with debugger I get the message: 'local module descriptor class for com.google.android.gms.vision.dynamite not found'. I've tried the app in other android 4.2.2 device. It works, but for some reason it doesn't work in mine. Can anyone help me with the above error? Some libraries I'm missing perhaps?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          fontFamily: 'sans-serif-light',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          const Divider(
            color: Colors.black,
            height: 40,
            thickness: 1,
            indent: 0,
            endIndent: 0,
          ),
          SizedBox(
            width: 2,
          ),
          new Text("2 Answers",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                fontFamily: 'sans-serif-light',
                color: Colors.black,
              )),
          Card(
              shape: const CircleBorder(),
              elevation: 1,
              child: Container(
                height: 70.h,
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
                        "for me, the device doesn't have google-play-service. I just download (google-play-service) from Google Play Store and update software. (oppo)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          fontFamily: 'sans-serif-light',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
          SizedBox(height: 20),
          Row(),
          SizedBox(height: 45),
        ]),
      ),
    );
  }
}
