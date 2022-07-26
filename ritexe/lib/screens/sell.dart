// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/models/item.dart';
import 'package:ritexe/screens/feed.dart';
import 'package:ritexe/screens/notifications.dart';
import 'package:ritexe/screens/postanitem.dart';
import 'package:ritexe/widgets/sell_card.dart';
import 'package:http/http.dart' as http;

class Sell extends StatefulWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  State<Sell> createState() => _SellState();
}

Future fetchItems() async {
  var itemResponse = await http.get(Uri.parse("http://10.0.2.2:8000/items/"));
  var itemThumbnails = [];

  var data = jsonDecode(itemResponse.body);
  for (var i in data) {
    var userResponse =
        await http.get(Uri.parse("http://10.0.2.2:8000/users/${i['user_id']}"));
    var username = jsonDecode(userResponse.body)[0]['username'];
    itemThumbnails.add(Item(
        title: i['name'],
        username: username,
        date: DateTime.parse(i['date']),
        quantity: i['quantity']));
  }
  return itemThumbnails;
}

class _SellState extends State<Sell> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [SellFeed(), PostItem(), Notifications()];
    List<Widget> appBars = [
      sellFeedAppBar(context),
      postItemAppBar,
      notificationsAppBar
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: appBars.elementAt(_selectedIndex),
      ),
      backgroundColor: primaryColor,
      body: screens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: secondaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add new',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}

class SellFeed extends StatefulWidget {
  const SellFeed({Key? key}) : super(key: key);

  @override
  State<SellFeed> createState() => _SellFeedState();
}

class _SellFeedState extends State<SellFeed> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: FutureBuilder(
        future: fetchItems(),
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
    );
  }
}

Row sellFeedAppBar(context) => Row(
      children: [
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
          width: 230.w,
          height: 35.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 10.w),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Search...'),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 5.w),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Feed()),
              );
            },
            icon: Icon(
              Icons.question_mark,
              color: primaryColor,
            ))
      ],
    );
