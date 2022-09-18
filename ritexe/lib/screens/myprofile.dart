// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/models/user.dart';
import 'package:ritexe/screens/myanswers.dart';
import 'package:ritexe/screens/myquestions.dart';
import 'package:ritexe/screens/posteditems.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ritexe/screens/signin.dart';

class Profile extends StatefulWidget {
  final int userId;
  const Profile({Key? key, required this.userId}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future fetchOneUser() async {
    var userResponse = await http
        .get(Uri.parse("http://10.0.2.2:8000/users/${widget.userId}"));

    var data = jsonDecode(userResponse.body);
    User user = User(
        id: data[0]["id"],
        name: data[0]["name"],
        email: data[0]["email"],
        password: data[0]["password"],
        upVote: data[0]["upvote"],
        username: data[0]["username"]);
    return user;
  }

  @override
  void initState() {
    super.initState();
    fetchOneUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Profile'),
          backgroundColor: secondaryColor,
          foregroundColor: Colors.white,
        ),
        backgroundColor: primaryColor,
        body: FutureBuilder(
            future: fetchOneUser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(
                    child: CircularProgressIndicator(
                  color: secondaryColor,
                ));
              } else {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 15.h),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Container(
                            child: Image.asset(
                              "assets/currentuser.png",
                              height: 80.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(snapshot.data.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.sp,
                              fontFamily: 'sans-serif-light',
                              color: Colors.white,
                            )),
                        Text("${snapshot.data.upVote} upvotes",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                              fontFamily: 'sans-serif-light',
                              color: Colors.black,
                            )),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            SizedBox(width: 48.w),
                            Text("username: ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.white,
                                )),
                            SizedBox(width: 10.w),
                            Text(snapshot.data.username,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.black,
                                )),
                          ],
                        ),
                        SizedBox(height: 18.h),
                        Row(
                          children: [
                            SizedBox(width: 48.w),
                            Text("email: ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.white,
                                )),
                            SizedBox(width: 10.h),
                            Text(snapshot.data.email,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.black,
                                )),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            SizedBox(width: 45.h),
                            Text("password:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.white,
                                )),
                            SizedBox(width: 10.sp),
                            Text("*******",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  fontFamily: 'sans-serif-light',
                                  color: Colors.black,
                                )),
                            SizedBox(width: 55.w),
                            // TextButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) =>
                            //               const EditPassword()),
                            //     );
                            //   },
                            //   child: Text("edit",
                            //       textAlign: TextAlign.right,
                            //       style: TextStyle(
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 18.sp,
                            //         fontFamily: 'sans-serif-light',
                            //         color: Color.fromARGB(255, 253, 252, 252),
                            //       )),
                            // ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        ElevatedButton(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                              child: Text(
                                "Posted Questions",
                                style: TextStyle(fontSize: 20.sp),
                              )),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secondaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyQuestions(userId: widget.userId)),
                            );
                          },
                        ),
                        SizedBox(height: 5.h),
                        ElevatedButton(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                              child: Text(
                                "Posted Answers",
                                style: TextStyle(fontSize: 20.sp),
                              )),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secondaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MyAnswers(userId: widget.userId)),
                            );
                          },
                        ),
                        SizedBox(height: 5.h),
                        ElevatedButton(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                              child: Text(
                                "Items for sale",
                                style: TextStyle(fontSize: 20.sp),
                              )),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secondaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PostedItems(userId: widget.userId)),
                            );
                          },
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                              child: Text(
                                "Logout",
                                style: TextStyle(fontSize: 20.sp),
                              )),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(secondaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()),
                            );
                          },
                        ),
                      ]),
                );
              }
            }));
  }
}
