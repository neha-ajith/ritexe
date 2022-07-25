// ignore: unused_import
// ignore_for_file: unused_import, unnecessary_new

import 'package:flutter/material.dart';

import 'package:ritexe/screens/feed.dart';

import 'package:ritexe/screens/myprofile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

import '../widgets/sell_card.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Profile'),
        backgroundColor: secondaryColor, // appbar color.
        foregroundColor: Colors.white,
      ),
      backgroundColor: primaryColor,
      // Image.asset(
      //                                 'D:\ritexe\ritexe\assets\currentuser 2.png',
      //                                 width: 300,
      //                                 height: 150,
      //                                 fit:BoxFit.fill

      //                               ),
      body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
        new Container(
            child: new Container(
              child: Image.asset(
                "assets/currentuser.png",
                 
                fit: BoxFit.fill,
              ),
            ),
        ),
         //SizedBox(height: 60),
        // Container(
        //   child: new Container(
        //       child: Image.asset(
        //         "assets/edit.png",
                 
        //         fit: BoxFit.fill,
        //       ),),
        //  ),
              SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text("John Doe",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        fontFamily: 'sans-serif-light',
                        color: Colors.white,

                      )),
                         Container(
          child: new Container(
            
              child: IconButton(
  icon:Image.asset(
                "assets/edit.png",
                 
                fit: BoxFit.fill,
              ),
              onPressed: () {},),
              ),
         ),
                ],
              ),
              SizedBox(height: 1),
              new Text("123 upvotes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: 'sans-serif-light',
                        color: Colors.black,
                        

                      )),
                      SizedBox(height: 20),
                      Row(//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 1),
                           SizedBox(width: 50),
                          new Text("username: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'sans-serif-light',
                            color: Colors.white,
                            

                          )),
                           SizedBox(height: 0),
                             SizedBox(width: 10),
                      new Text("john.doe",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: 'sans-serif-light',
                        color: Colors.black,

                      )),
                        ],
                      ),
                      
                      SizedBox(height: 20),
                      Row(//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 50),
                          new Text("email: ",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'sans-serif-light',
                            color: Colors.white,

                          )),
                          SizedBox(height: 0),
                            SizedBox(width: 10),
                      new Text("john.doe@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: 'sans-serif-light',
                        color: Colors.black,

                      )),
                        ],
                      ),
                       
                      SizedBox(height: 20),
                      Row(//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(width: 50),
                          new Text("password:",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            fontFamily: 'sans-serif-light',
                            color: Colors.white,

                          )),
                          SizedBox(height: 0),
                          SizedBox(width: 10),
                      new Text("*******",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: 'sans-serif-light',
                        color: Colors.black,

                      )),

                      SizedBox(width: 60),
                      TextButton(onPressed: () {
                        
                      }, child: 
                       new Text("edit",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        fontFamily: 'sans-serif-light',
                        color: Color.fromARGB(255, 253, 252, 252),

                      )),
                      ),
                        ],
                      ),
                       SizedBox(height: 45),
                       
                     
             
             ElevatedButton(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Text(
                    "Posted Questions",
                    style: TextStyle(fontSize: 22),
                  )),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ))),
              onPressed: () {},
            ),          
            
SizedBox(height:5),
            ElevatedButton(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Text(
                    "Posted Answers",
                    style: TextStyle(fontSize: 22),
                  )),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ))),
              onPressed: () {},
            ),
SizedBox(height: 5),
            ElevatedButton(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Text(
                    "Items for sale",
                    style: TextStyle(fontSize: 22),
                  )),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ))),
              onPressed: () {},
            ),
        
      ]),
          )

          //    body: Center(
          //       child: Text('Hello World'),
          ),
    );
  }
}
