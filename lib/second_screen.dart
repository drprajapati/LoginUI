import 'package:flutter/material.dart';

class SecondClass extends StatefulWidget {
  String title;
  @override
  State<StatefulWidget> createState() {
    return SecondPageTest(title);
  }

  SecondClass(String s);
}

class SecondPageTest extends State<SecondClass> {
  SecondPageTest(String title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("Practicals", style: TextStyle(color: Colors.teal)),
        elevation: 2.0,
      ),
      body: Container(
        color: Colors.cyan,
      ),
    );
  }
}
