// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/screens/signin.dart';

void main() {
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
              home: SignIn(),
            ));
  }
}
