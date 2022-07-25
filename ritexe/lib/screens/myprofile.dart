// ignore: unused_import
// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:ritexe/screens/feed.dart';

import 'package:ritexe/screens/myprofile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

import '../widgets/sell_card.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Profile'),
          backgroundColor: secondaryColor, // appbar color.
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 100,
                width: 100,
              ),
              //  Expanded(
              //    child: Container(
              //      color: Colors.orange,
              //      height: 100,
              //    ),
              //  ),
              //  Container(
              //    color: Colors.blue,
              //    height: 100,
              //    width: 100,
              //  ),
            ],
          ),
        )

        //    body: Center(
        //       child: Text('Hello World'),

        );
  }
}
