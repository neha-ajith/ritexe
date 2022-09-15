// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:http/http.dart' as http;
import 'package:ritexe/models/answer.dart';
import 'dart:convert';
import 'package:ritexe/models/question.dart';

class QuestionPage extends StatefulWidget {
  final int id;
  const QuestionPage({Key? key, required this.id}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  Future fetchOneQuestion() async {
    var questionResponse = await http
        .get(Uri.parse("http://10.0.2.2:8000/questions/fetch/${widget.id}"));
    var data = jsonDecode(questionResponse.body);
    // print(data);
    var question = Question(
        qsId: data[0]['qs_id'],
        qsTitle: data[0]['qs_title'],
        qsDescription: data[0]['qs_desc']);
    return question;
  }

  Future fetchAnswers() async {
    bool isUpvoted = false, isDownvoted = false;
    var answerResponse =
        await http.get(Uri.parse("http://10.0.2.2:8000/answers/${widget.id}"));
    var answers = [];
    var data = jsonDecode(answerResponse.body);
    var num = data.length;
    // print(data);
    for (var a in data) {
      isUpvoted = false;
      isDownvoted = false;
      var upVoteResponse = await http.get(
          Uri.parse("http://10.0.2.2:8000/upvotes/$userId/${a['ans_id']}"));
      var upVoteData = jsonDecode(upVoteResponse.body);
      if (upVoteData.length != 0) {
        isUpvoted = true;
      }
      var downVoteResponse = await http.get(
          Uri.parse("http://10.0.2.2:8000/downvotes/$userId/${a['ans_id']}"));
      var downVoteData = jsonDecode(downVoteResponse.body);
      if (downVoteData.length != 0) {
        isDownvoted = true;
      }
      answers.add(Answer(
          isDownvoted: isDownvoted,
          isUpvoted: isUpvoted,
          ans: a['ans'],
          ansId: a['ans_id'],
          downVote: a['downvote'],
          qsId: a['qs_id'],
          upVote: a['upvote'],
          userId: a['user_id']));
    }

    return [answers, num];
  }

  Future saveAnswer(Answer answer) async {
    await http.post(Uri.parse("http://10.0.2.2:8000/answers/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'ans': answer.ans,
          'upVote': answer.upVote.toString(),
          'downVote': answer.downVote.toString(),
          'date': DateTime.now().toString(),
          'user_id': answer.userId.toString(),
          'qs_id': answer.qsId.toString()
        }));
  }

  Future saveUpVoteData(ansId, userId) async {
    await http.post(Uri.parse("http://10.0.2.2:8000/upvotes/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'ans_id': ansId.toString(),
          'user_id': userId.toString()
        }));
  }

  Future saveUpVote(int ansId, Answer answer) async {
    await http.post(Uri.parse("http://10.0.2.2:8000/answers/upvote/$ansId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'upVote': (answer.upVote + 1).toString(),
        }));
  }

  Future saveDownVote(int ansId, Answer answer) async {
    await http.post(Uri.parse("http://10.0.2.2:8000/answers/downvote/$ansId"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'upVote': (answer.downVote + 1).toString(),
        }));
  }

  Future saveDownVoteData(Answer answer) async {
    await http.post(Uri.parse("http://10.0.2.2:8000/downvotes/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'ans_id': answer.ansId.toString(),
          'user_id': userId.toString()
        }));
  }

  @override
  void initState() {
    super.initState();
    fetchOneQuestion();
    fetchAnswers();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController answerController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Questions'),
          backgroundColor: secondaryColor,
          foregroundColor: Colors.white,
        ),
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 10.h),
                child: Form(
                    child: Column(children: [
                  FutureBuilder(
                      future: fetchOneQuestion(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: secondaryColor,
                          ));
                        } else {
                          return Column(children: [
                            Text(snapshot.data.qsTitle,
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "18 Jun '22",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black,
                                  ),
                                  const BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0, 1.6),
                                    blurRadius: 3,
                                    spreadRadius: -3,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Text(
                                  snapshot.data.qsDescription,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                    fontFamily: 'sans-serif-light',
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Divider(
                                color: Colors.black,
                                thickness: 1,
                                indent: 0,
                                endIndent: 0),
                          ]);
                        }
                      }),
                  FutureBuilder(
                      future: fetchAnswers(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return Center(
                              child: CircularProgressIndicator(
                            color: secondaryColor,
                          ));
                        } else {
                          return Column(children: [
                            Row(children: [
                              Text("${snapshot.data[1]} Answers",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp))
                            ]),
                            SizedBox(height: 10.h),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data[0].length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8.h),
                                      child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                const BoxShadow(
                                                  color: Colors.black,
                                                ),
                                                const BoxShadow(
                                                    color: Colors.black,
                                                    offset: Offset(0, 1.6),
                                                    blurRadius: 3,
                                                    spreadRadius: -3)
                                              ]),
                                          child: Padding(
                                              padding: EdgeInsets.all(10.sp),
                                              child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        snapshot
                                                            .data[0][index].ans,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16.sp,
                                                            fontFamily:
                                                                'sans-serif-light',
                                                            color:
                                                                Colors.black)),
                                                    SizedBox(height: 10.h),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(children: [
                                                            Row(children: [
                                                              IconButton(
                                                                  color: snapshot
                                                                          .data[
                                                                              0]
                                                                              [
                                                                              index]
                                                                          .isUpvoted
                                                                      ? Colors
                                                                          .green
                                                                      : Colors
                                                                          .black,
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  icon: Icon(Icons
                                                                      .arrow_upward_rounded),
                                                                  onPressed:
                                                                      () {
                                                                    setState(
                                                                        () {
                                                                      // saveUpVote(
                                                                      //     snapshot
                                                                      //         .data[0][index]
                                                                      //         .ansId,
                                                                      //     userId);
                                                                    });
                                                                  }),
                                                              Text(snapshot
                                                                  .data[0]
                                                                      [index]
                                                                  .upVote
                                                                  .toString())
                                                            ]),
                                                            SizedBox(
                                                                width: 10.w),
                                                            Row(children: [
                                                              IconButton(
                                                                color: snapshot
                                                                        .data[0]
                                                                            [
                                                                            index]
                                                                        .isDownvoted
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .black,
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                icon: Icon(Icons
                                                                    .arrow_downward_rounded),
                                                                onPressed: () {
                                                                  //write code for downvoting answer
                                                                },
                                                              ),
                                                              Text(snapshot
                                                                  .data[0]
                                                                      [index]
                                                                  .downVote
                                                                  .toString())
                                                            ])
                                                          ]),
                                                          Text("18 Jun '22")
                                                        ])
                                                  ]))));
                                }),
                            SizedBox(height: 10.h),
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
                                          spreadRadius: -1)
                                    ]),
                                width: double.infinity,
                                height: 180.h,
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 5.h),
                                    child: TextField(
                                      controller: answerController,
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Your answer...'),
                                    ))),
                            SizedBox(height: 30.h),
                            ElevatedButton(
                                child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 8.h),
                                    child: Text(
                                      "Post",
                                      style: TextStyle(fontSize: 20.sp),
                                    )),
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        secondaryColor),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ))),
                                onPressed: () {
                                  setState(() {
                                    saveAnswer(Answer(
                                        ans: answerController.text,
                                        qsId: widget.id,
                                        userId: userId));
                                  });
                                })
                          ]);
                        }
                      })
                ])))));
  }
}
