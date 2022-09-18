// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/models/question_thumbnail.dart';
import 'package:ritexe/widgets/question_card.dart';
import 'package:http/http.dart' as http;

class MyQuestions extends StatefulWidget {
  final int userId;
  const MyQuestions({Key? key, required this.userId}) : super(key: key);

  @override
  State<MyQuestions> createState() => _MyQuestionsState();
}

class _MyQuestionsState extends State<MyQuestions> {
  Future fetchUserQuestion() async {
    var questionResponse = await http
        .get(Uri.parse("http://10.0.2.2:8000/questions/${widget.userId}"));
    var questionThumbnails = [];

    var data = jsonDecode(questionResponse.body);
    for (var q in data) {
      var answerResponse = await http
          .get(Uri.parse("http://10.0.2.2:8000/answers/${q['qs_id']}"));
      int num = jsonDecode(answerResponse.body).length;
      questionThumbnails.add(QuestionThumbNail(
        id: q['qs_id'],
        title: q['qs_title'],
        noOfAnswers: num,
      ));
    }
    return questionThumbnails;
  }

  @override
  void initState() {
    super.initState();
    fetchUserQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text("My Questions"),
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: FutureBuilder(
          future: fetchUserQuestion(),
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
    );
  }
}
