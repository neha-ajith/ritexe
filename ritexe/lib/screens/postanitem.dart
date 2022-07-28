// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/models/item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostItem extends StatefulWidget {
  const PostItem({Key? key}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

Future saveItem(Item item) async {
  await http.post(Uri.parse("http://10.0.2.2:8000/items/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': item.title,
        'quantity': item.quantity.toString(),
        'date': DateTime.now().toString(),
        'user_id': userId.toString()
      }));
}

class _PostItemState extends State<PostItem> {
  TextEditingController titleController = TextEditingController();
  TextEditingController quanityController = TextEditingController();
  // TextEditingController tagsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Form(
        child: Column(
          children: [
            Container(
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
              width: double.infinity,
              height: 50.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Item Name'),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
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
              width: double.infinity,
              height: 180.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Description'),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
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
              width: double.infinity,
              height: 50.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                child: TextField(
                  controller: quanityController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Quantity'),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(
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
              width: double.infinity,
              height: 50.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Contact'),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                  child: Text(
                    "Post",
                    style: TextStyle(fontSize: 20.sp),
                  )),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ))),
              onPressed: () {
                setState(() {
                  saveItem(Item(
                      title: titleController.text,
                      quantity: int.parse(quanityController.text),
                      date: DateTime.now()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

Text postItemAppBar = Text("Post an item");
