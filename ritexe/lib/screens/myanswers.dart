// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/screens/question_page.dart';
import 'package:ritexe/widgets/question_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ritexe/models/question_thumbnail.dart';

class MyAnswers extends StatefulWidget {
  final int userId;
  const MyAnswers({Key? key, required this.userId}) : super(key: key);

  @override
  State<MyAnswers> createState() => _MyAnswersState();
}

class _MyAnswersState extends State<MyAnswers> {
  Future fetchUserAnswers() async {
    var answerResponse = await http
        .get(Uri.parse("http://10.0.2.2:8000/answers/users/${widget.userId}"));
    var data = jsonDecode(answerResponse.body);
    var questionThumbnails = [];
    // print(data);
    for (var a in data) {
      var questionResponse = await http
          .get(Uri.parse("http://10.0.2.2:8000/questions/fetch/${a['qs_id']}"));
      var questionData = jsonDecode(questionResponse.body);
      var questionAnswerResponse = await http
          .get(Uri.parse("http://10.0.2.2:8000/answers/${a['qs_id']}"));
      var num = jsonDecode(questionAnswerResponse.body).length;
      questionThumbnails.add(QuestionThumbNail(
          id: questionData[0]['qs_id'],
          title: questionData[0]['qs_title'],
          noOfAnswers: num));
    }
    return questionThumbnails;
  }

  @override
  void initState() {
    super.initState();
    fetchUserAnswers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: Text("My Answers"),
          leading: BackButton(color: Colors.white),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: FutureBuilder(
              future: fetchUserAnswers(),
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
                        return GestureDetector(
                          onTap: (() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuestionPage(
                                        userId: widget.userId,
                                        id: snapshot.data[index].id)));
                          }),
                          child: QuestionCard(
                              title: snapshot.data[index].title,
                              noOfAnswers:
                                  snapshot.data[index].noOfAnswers.toString()),
                        );
                      });
                }
              }),
        ));
  }
}
