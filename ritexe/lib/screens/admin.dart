// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/models/report.dart';
import 'package:ritexe/screens/signin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Future fetchReport() async {
    var reportResponse =
        await http.get(Uri.parse("http://10.0.2.2:8000/reports/"));
    var data = jsonDecode(reportResponse.body);
    var reports = [];
    for (var a in data) {
      var ansResponse = await http
          .get(Uri.parse("http://10.0.2.2:8000/answers/ans/${a['pos_id']}"));
      var ansData = jsonDecode(ansResponse.body);
      reports.add(Report(
        repId: a['rep_id'],
        posId: a['pos_id'],
        title: ansData[0]['ans'],
      ));
    }
    return reports;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Reports'),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                icon: Icon(Icons.person_remove))
          ],
        ),
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: primaryColor,
      body: FutureBuilder(
          future: fetchReport(),
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 120.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.black,
                            ),
                            const BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 1.6),
                              blurRadius: 3,
                              spreadRadius: -3,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("New report: "),
                              SizedBox(height: 10.h),
                              Text(
                                "\"${snapshot.data[index].title}\"",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
