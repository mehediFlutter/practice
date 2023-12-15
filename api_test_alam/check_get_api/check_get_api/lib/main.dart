import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(GetApi());
}

class GetApi extends StatefulWidget {
  const GetApi({super.key});

  @override
  State<GetApi> createState() => _GetApiState();
}

class _GetApiState extends State<GetApi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("I am init State");
    getInfo();
  }

  void getInfo() async {
    Response response = await get(
        Uri.parse("https://rm.guideasy.com/api/tasks"));
    print(response.statusCode);
    print(response.body);
    final Map<String,dynamic> decode = jsonDecode(response.body);
    print(decode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Center(child: Text("Hi"))],
        ),
      ),
    );
  }
}
