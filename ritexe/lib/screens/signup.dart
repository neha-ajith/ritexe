// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/models/user.dart';
import 'package:ritexe/screens/feed.dart';
import 'package:ritexe/screens/signin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  final bool isMessageVisible;
  const SignUp({Key? key, this.isMessageVisible = false}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

Future fetchUser(String username) async {
  var userResponse =
      await http.get(Uri.parse("http://10.0.2.2:8000/users/auth/$username"));
  var data = jsonDecode(userResponse.body);
  if (data.length == 0) {
    return true;
  } else {
    return false;
  }
}

Future fetchUserId() async {
  var userResponse =
      await http.get(Uri.parse("http://10.0.2.2:8000/users/auth/$username"));
  var data = jsonDecode(userResponse.body);
  return data[0]['id'];
}

Future saveuser(User user) async {
  await http.post(Uri.parse("http://10.0.2.2:8000/users/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': user.username,
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'upVotes': user.upVote.toString(),
      }));
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: backgroundImage,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Form(
            child: Column(
              children: [
                SizedBox(
                  height: 80.h,
                ),
                Container(
                  height: 60.h,
                  width: 300.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 35.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Visibility(
                    visible: widget.isMessageVisible,
                    child: Text(
                        'Username exists. Please enter a different username.',
                        style: TextStyle(color: Colors.red))),
                SizedBox(height: 20.h),
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
                  width: double.infinity,
                  height: 50.h,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Full Name',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  alignment: Alignment.center,
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
                  width: double.infinity,
                  height: 50.h,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'Email'),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
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
                  width: double.infinity,
                  height: 50.h,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
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
                  width: double.infinity,
                  height: 50.h,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                ElevatedButton(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18.sp),
                      )),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(secondaryColor),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ))),
                  onPressed: () async {
                    var res = await fetchUser(usernameController.text);
                    if (res) {
                      // call post function
                      saveuser(User(
                          id: 0,
                          name: nameController.text,
                          username: usernameController.text,
                          email: emailController.text,
                          password: passwordController.text));
                      username = usernameController.text;
                      userId = await fetchUserId();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Feed()),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SignUp(isMessageVisible: true)),
                      );
                    }
                  },
                ),
                SizedBox(height: 18.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Existing User?',
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()),
                          );
                        }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
