// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/models/item.dart';
import 'package:ritexe/widgets/my_item_card.dart';
import 'package:http/http.dart' as http;

class PostedItems extends StatefulWidget {
  final int userId;
  const PostedItems({Key? key, required this.userId}) : super(key: key);

  @override
  State<PostedItems> createState() => _PostedItemsState();
}

class _PostedItemsState extends State<PostedItems> {
  Future fetchUserItems() async {
    var itemResponse = await http
        .get(Uri.parse("http://10.0.2.2:8000/items/${widget.userId}"));
    var userResponse = await http
        .get(Uri.parse("http://10.0.2.2:8000/users/${widget.userId}"));

    var itemThumbnails = [];
    var username = jsonDecode(userResponse.body)[0]['username'];
    var email = jsonDecode(userResponse.body)[0]['email'];

    var data = jsonDecode(itemResponse.body);
    for (var i in data) {
      itemThumbnails.add(Item(
          email: email,
          title: i['name'],
          username: username,
          date: DateTime.parse(i['date']),
          quantity: i['quantity']));
    }
    return itemThumbnails;
  }

  @override
  void initState() {
    super.initState();
    fetchUserItems();
  }

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
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: FutureBuilder(
            future: fetchUserItems(),
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
                      return MySellCard(
                          title: snapshot.data[index].title,
                          username: snapshot.data[index].username,
                          date: DateFormat("dd MMM yyyy")
                              .format(snapshot.data[index].date)
                              .toString(),
                          qty: snapshot.data[index].quantity.toString());
                    });
              }
            },
          ),
        ));
  }
}
