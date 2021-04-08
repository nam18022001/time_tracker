import 'package:flutter/material.dart';
import 'package:time_tracker_demo/app/sign_in_page.dart';
import 'package:time_tracker_demo/test.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: SignInPage(),
    );
  }
}
