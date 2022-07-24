//todo: pull new changes.

import 'package:flutter/material.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/screens/temp.dart';
import 'package:ritexe/widgets/question_card.dart';
import 'package:ritexe/widgets/sell_card.dart';

class PostedItems extends StatelessWidget {
  const PostedItems({Key? key}) : super(key: key);

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
            SellCard(
                qty: "1", title: "Set square available", date: "12 Jun, 2022,"),
            QuestionCard(title: "set square available", noOfAnswers: "4"),
            QuestionCard(title: "set square available", noOfAnswers: "2"),
            QuestionCard(title: "set square available", noOfAnswers: "1"),
          ],
        ),
      ),
    );
  }
}
