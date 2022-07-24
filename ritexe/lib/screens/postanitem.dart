// ignore: unused_import
// ignore_for_file: unused_import

import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:ritexe/screens/feed.dart';

import 'package:ritexe/screens/postanitem.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

import '../widgets/sell_card.dart';

class PostItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Post an item'),
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          // TextField(
          //   minLines: null,
          //   maxLines: null,
          //   expands: true,
          //   textAlign: TextAlign.center,
          //   decoration: InputDecoration(
          //     filled: true,
          //     fillColor: Color.fromARGB(255, 253, 252, 252),
          //     contentPadding: EdgeInsets.symmetric(vertical: 20.0),
          //     border: OutlineInputBorder(),
          //     hintText: 'Item Name',
          //     hintStyle: TextStyle(
          //       fontSize: 20,
          //     ),
          //     errorBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(22),
          //     ),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(22),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       gapPadding: 0.0,
          //       borderRadius: BorderRadius.circular(22),
          //     ),
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
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
            width: double.infinity,
            height: 45.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Item Name'),
              ),
            ),
          ),

           SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
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
            width: double.infinity,
            height: 76.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Description'),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
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
            width: double.infinity,
            height: 45.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Quantity'),
                    
              ),
            ),
          ),
          
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
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
            width: double.infinity,
            height: 45.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: InputBorder.none, hintText: 'Contact'),
              ),
            ),
          ),
          
          
          SizedBox(height: 50),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(secondaryColor),
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
        ]),
      ),
    );
  }
}
