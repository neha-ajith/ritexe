// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/models/question_thumbnail.dart';
import 'package:ritexe/screens/notifications.dart';
import 'package:ritexe/screens/postque.dart';
import 'package:ritexe/screens/sell.dart';
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
  List<Widget> screens = [Questions(), PostQuestion(), Sell(), Notifications()];
  List<PreferredSizeWidget> appBars = [
    questionAppBar,
    postQuestionAppBar,
    sellAppBar,
    notificationsAppBar
  ];

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
      resizeToAvoidBottomInset: false,
      appBar: appBars.elementAt(_selectedIndex),
      backgroundColor: primaryColor,
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: secondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark),
            label: 'Questions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add new',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Questions extends StatefulWidget {
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                      noOfAnswers: snapshot.data[index].noOfAnswers.toString());
                });
          }
        },
      ),
    );
  }
}

AppBar questionAppBar = AppBar(
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
        width: 220.w,
        height: 35.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              Icon(Icons.search, color: Colors.grey),
              SizedBox(width: 10.w),
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
      SizedBox(width: 10.w),
    ],
  ),
);
