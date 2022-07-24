import 'package:flutter/material.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

class posteditems extends StatelessWidget {
  const posteditems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text("Posted Items"),
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            QuestionCard(title: "set square available", noOfAnswers: "4"),
            QuestionCard(title: "set square available", noOfAnswers: "2"),
            QuestionCard(title: "set square available", noOfAnswers: "1"),
          ],
        ),
      ),
    );
  }
}
