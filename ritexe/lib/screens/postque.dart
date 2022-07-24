// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ritexe/globals/globals.dart';

class PostQuestion extends StatelessWidget {
  const PostQuestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          SizedBox(height: 50),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              hintText: "Question Title",
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
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              hintText: "Question  Description",
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
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              hintText: "Tags",
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
              foregroundColor: MaterialStateProperty.all<Color>(secondaryColor),
            ),
            onPressed: () {},
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
    );
  }
}

PreferredSize postQuestionAppBar = PreferredSize(
    preferredSize: Size.fromHeight(170),
    child: AppBar(
      backgroundColor: secondaryColor,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Post a question",
            style: TextStyle(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ));
