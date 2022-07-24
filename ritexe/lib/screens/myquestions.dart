import 'package:flutter/material.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

class myquestions extends StatelessWidget {
  const myquestions({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            QuestionCard(title: "reupload", noOfAnswers: "4"),
            QuestionCard(title: "reupload", noOfAnswers: "2"),
            QuestionCard(title: "reupload", noOfAnswers: "1"),
            QuestionCard(title: "reupload", noOfAnswers: "3")
          ],
        ),
      ),
    );
  }
}
