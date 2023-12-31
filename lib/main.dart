import 'package:api_tutorials_flutter/Rest%20API/Signup.dart';
import 'package:api_tutorials_flutter/example_five.dart';
import 'package:api_tutorials_flutter/example_four.dart';
import 'package:api_tutorials_flutter/example_three.dart';
import 'package:api_tutorials_flutter/example_two.dart';
import 'package:api_tutorials_flutter/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const SignUp(),
    );
  }
}
