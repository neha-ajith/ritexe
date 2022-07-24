import 'package:flutter/material.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

class dropdown extends StatelessWidget {
  const dropdown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //final quantity = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Post an item",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 50),
            SizedBox(height: 30),
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
              width: 400,
              height: 55,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Quantity'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
