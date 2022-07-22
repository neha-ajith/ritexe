// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/models/question_thumbnail.dart';
import 'package:ritexe/widgets/question_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

Future fetchQuestion() async {
  var questionResponse =
      await http.get(Uri.parse("http://10.0.2.2:8000/questions/"));
  var questionThumbnails = [];
  print(jsonDecode(questionResponse.body));

  var data = jsonDecode(questionResponse.body);
  for (var q in data) {
    var answerResponse =
        await http.get(Uri.parse("http://10.0.2.2:8000/answers/${q['qs_id']}"));
    int num = jsonDecode(answerResponse.body).length;
    questionThumbnails.add(QuestionThumbNail(
      title: q['qs_title'],
      noOfAnswers: num,
    ));
  }
  return questionThumbnails;
}

class _FeedState extends State<Feed> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Row(
          children: [
            CircleAvatar(
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
              backgroundColor: Colors.black,
            ),
            SizedBox(width: 20.w),
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
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
          future: fetchQuestion(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                  child: CircularProgressIndicator(
                color: secondaryColor,
              ));
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return QuestionCard(
                        title: snapshot.data[index].title,
                        noOfAnswers:
                            snapshot.data[index].noOfAnswers.toString());
                  });
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Sell/Borrow',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add new',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
