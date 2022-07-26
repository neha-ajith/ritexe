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
  const PostedItems({Key? key}) : super(key: key);

  @override
  State<PostedItems> createState() => _PostedItemsState();
}

Future fetchUserItems() async {
  var itemResponse =
      await http.get(Uri.parse("http://10.0.2.2:8000/items/$userId"));
  var userResponse =
      await http.get(Uri.parse("http://10.0.2.2:8000/users/$userId"));

  var itemThumbnails = [];
  var username = jsonDecode(userResponse.body)[0]['username'];

  var data = jsonDecode(itemResponse.body);
  for (var i in data) {
    itemThumbnails.add(Item(
        title: i['name'],
        username: username,
        date: DateTime.parse(i['date']),
        quantity: i['quantity']));
  }
  return itemThumbnails;
}

class _PostedItemsState extends State<PostedItems> {
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
