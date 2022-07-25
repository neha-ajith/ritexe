// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ritexe/editpassword.dart';
import 'package:ritexe/screens/dropdown.dart';
import 'package:ritexe/screens/feed.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/screens/postanitem.dart';
import 'package:ritexe/screens/postitemtemp.dart';
import 'package:ritexe/screens/signin.dart';
import 'package:ritexe/screens/signup.dart';

void main() {
  var items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(393, 781),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) => MaterialApp(
              builder: (context, widget) {
                // print(MediaQuery.of(context).size.width); 392.72727272727275
                // print(MediaQuery.of(context).size.height); 781.0909090909091

                ScreenUtil.init(context);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget!,
                );
              },
              home: editpassword(),
            ));
  }
}
