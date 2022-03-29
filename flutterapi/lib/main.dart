import 'package:flutter/material.dart';
import 'package:flutterapi/page/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.redAccent,
          scaffoldBackgroundColor: Colors.white),
      home: Home(),
    );
  }
}
