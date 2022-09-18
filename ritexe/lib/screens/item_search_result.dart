import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ritexe/models/item.dart';
import 'package:ritexe/widgets/sell_card.dart';

class ItemSearchResult extends StatefulWidget {
  final int userId;
  final String val;
  const ItemSearchResult({Key? key, required this.val, required this.userId})
      : super(key: key);

  @override
  State<ItemSearchResult> createState() => _ItemSearchResultState();
}

Future searchItem(String value) async {
  var itemResponse = await http.get(Uri.parse("http://10.0.2.2:8000/items/"));
  var itemThumbnails = [];

  var data = jsonDecode(itemResponse.body);
  for (var i in data) {
    if (i['name'].toLowerCase().contains(value.toLowerCase())) {
      var userResponse = await http
          .get(Uri.parse("http://10.0.2.2:8000/users/${i['user_id']}"));
      var username = jsonDecode(userResponse.body)[0]['username'];
      var email = jsonDecode(userResponse.body)[0]['email'];
      itemThumbnails.add(Item(
          email: email,
          title: i['name'],
          username: username,
          date: DateTime.parse(i['date']),
          quantity: i['quantity']));
    }
  }
  return itemThumbnails;
}

class _ItemSearchResultState extends State<ItemSearchResult> {
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
            future: searchItem(widget.val),
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
                      return SellCard(
                          userId: widget.userId,
                          email: snapshot.data[index].email,
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
