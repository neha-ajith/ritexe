import 'package:flutter/material.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

class notifications extends StatelessWidget {
  const notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text("Notifications"),
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            QuestionCard(title: "you have a new buyer!", noOfAnswers: "4"),
            QuestionCard(title: "you have a new buyer!", noOfAnswers: "2"),
            QuestionCard(title: "you have a new buyer!", noOfAnswers: "1"),
            QuestionCard(title: "you have a new buyer!", noOfAnswers: "3")
          ],
        ),
      ),
    );
  }
}
