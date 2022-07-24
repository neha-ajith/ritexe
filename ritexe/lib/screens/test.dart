// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:http/http.dart' as http;
import 'package:ritexe/models/user.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

Future fetchUsers() async {
  var response = await http.get(Uri.parse("http://localhost:8000"));
  var users = [];
  for (var u in jsonDecode(response.body)) {
    users.add(User(
        id: u["id"],
        name: u["name"],
        email: u["email"],
        password: u["password"]));
  }
  return users;
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchUsers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return CircularProgressIndicator();
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      title: Text(snapshot.data[index].name),
                      subtitle: Text(snapshot.data[index].email));
                });
          }
        },
      ),
    );

    // decoration: backgroundImage);
  }
}
