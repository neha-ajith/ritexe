import 'package:flutter/material.dart';
import 'package:ritexe/globals/globals.dart';
import 'package:ritexe/widgets/question_card.dart';

class postanitem extends StatelessWidget {
  const postanitem({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Post an item",
              style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(height: 50),
            //SizedBox(height: 20),
            //SizedBox(height: 10),
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
              width: 400,
              height: 55,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Item Name'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
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
              width: 400,
              height: 200,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Description'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
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
              width: 400,
              height: 55,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Quantity'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
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
              width: 400,
              height: 55,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Contact'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                  child: Text(
                    "Post",
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
          ],
        ),
      ),
    );
  }
}
