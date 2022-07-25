// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/screens/feed.dart';
import 'package:ritexe/screens/notifications.dart';
import 'package:ritexe/screens/postanitem.dart';
import 'package:ritexe/widgets/sell_card.dart';

class Sell extends StatefulWidget {
  const Sell({Key? key}) : super(key: key);

  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(children: [
          SellCard(
              title: "set square available", qty: "1", date: "15 June,2022"),
          SellCard(
              title: "set square available", qty: "1", date: "15 June,2022"),
          SellCard(
              title: "set square available", qty: "1", date: "15 June,2022"),
          SellCard(
              title: "set square available", qty: "1", date: "15 June,2022"),
          SellCard(
              title: "set square available", qty: "1", date: "15 June,2022")
        ]),
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
