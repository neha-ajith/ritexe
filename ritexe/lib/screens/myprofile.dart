// ignore: unused_import
// ignore_for_file: unused_import

import 'dart:html';

import 'package:flutter/material.dart';

import 'package:ritexe/screens/feed.dart';

import 'package:ritexe/screens/myprofile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

import '../widgets/sell_card.dart';



class Profile extends StatelessWidget {
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
            child: Column(
              children: [
                //SizedBox(height: 20),
                 new Text("John Doe",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      fontFamily: 'sans-serif-light',
                                      color: Colors.black)),
                                      
              ],
            ),

        )
        
    //    body: Center(
   //       child: Text('Hello World'),
        
      
    );
  }
}