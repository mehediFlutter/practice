import 'dart:convert';
import 'package:api_test_alam/login.dart';
import 'package:api_test_alam/registration.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TestAPI extends StatefulWidget {
 static GlobalKey globalKey = GlobalKey();
   TestAPI({super.key});

  @override
  State<TestAPI> createState() => _TestAPIState();
}

class _TestAPIState extends State<TestAPI> {
    

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: TestAPI.globalKey,
      home: Login()
    );
  }
}
