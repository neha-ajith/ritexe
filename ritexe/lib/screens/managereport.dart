// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:ritexe/globals/globals.dart';
// ignore: unused_import
import 'package:ritexe/models/managereport.dart';
import 'package:ritexe/widgets/my_item_card.dart';
import 'package:http/http.dart' as http;

import '../widgets/report_card.dart';
import '../widgets/sell_card.dart';

class ManageReport extends StatefulWidget {
  const ManageReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text("Manage Report"),
        leading: BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            
            ReportCard(title: "This answer has been reported due to abusive words.......", date: "12 Jun, 2022", username: 'john123',),
             ReportCard(title: "This is inappropriate.......", date: "12 Jun, 2022", username: 'john123',),
              ReportCard(title: "This is inappropriate.......", date: "12 Jun, 2022", username: 'john123',),
          ],
        ),
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}