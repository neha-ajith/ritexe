import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ritexe/models/question_thumbnail.dart';
import 'package:ritexe/screens/question_page.dart';
import 'package:ritexe/widgets/question_card.dart';

class QuestionSearchResult extends StatefulWidget {
  final String val;
  const QuestionSearchResult({Key? key, required this.val}) : super(key: key);

  @override
  State<QuestionSearchResult> createState() => _QuestionSearchResultState();
}

Future searchQuestion(String value) async {
  var questionResponse =
      await http.get(Uri.parse("http://10.0.2.2:8000/questions/"));
  var questionThumbnails = [];

  var data = jsonDecode(questionResponse.body);
  for (var q in data) {
    if (q['qs_desc'].toLowerCase().contains(value.toLowerCase())) {
      var answerResponse = await http
          .get(Uri.parse("http://10.0.2.2:8000/answers/${q['qs_id']}"));
      int num = jsonDecode(answerResponse.body).length;

      questionThumbnails.add(QuestionThumbNail(
        id: q['qs_id'],
        title: q['qs_title'],
        noOfAnswers: num,
      ));
    }
  }
  return questionThumbnails;
}

class _QuestionSearchResultState extends State<QuestionSearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
            backgroundColor: secondaryColor,
            title: const Text("Search results")),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: FutureBuilder(
            future: searchQuestion(widget.val),
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
                                      id: snapshot.data[index].id)));
                        }),
                        child: QuestionCard(
                            title: snapshot.data[index].title,
                            noOfAnswers:
                                snapshot.data[index].noOfAnswers.toString()),
                      );
                    });
              }
            },
          ),
        ));
  }
}
