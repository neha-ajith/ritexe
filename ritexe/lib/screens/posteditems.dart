// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:ritexe/globals/globals.dart';
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
                qty: "1", title: "Set square available", date: "12 Jun, 2022"),
            SellCard(
                qty: "1", title: "Set square available", date: "12 Jun, 2022"),
            SellCard(
                qty: "1", title: "Set square available", date: "12 Jun, 2022"),
            SellCard(
                qty: "1", title: "Set square available", date: "12 Jun, 2022"),
          ],
        ),
      ),
    );
  }
}
