import 'dart:convert';

import 'package:api_test_alam/login.dart';
import 'package:api_test_alam/model/login_model.dart';
import 'package:api_test_alam/service/auth_utility.dart';
import 'package:api_test_alam/service/network_caller.dart';
import 'package:api_test_alam/service/network_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TaskIndexDetails extends StatefulWidget {
  const TaskIndexDetails({super.key});

  @override
  State<TaskIndexDetails> createState() => _TaskIndexDetailsState();
}

class _TaskIndexDetailsState extends State<TaskIndexDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    demo();
    
  }

  void demo() async{
   Response response = await get(Uri.parse("https://rm.guideasy.com/api/tasks"));
    print("Hi am in new stage response body is");
    print(jsonDecode(response.body));
    // final Map<String,dynamic> decode = jsonDecode(response.body!);
    // print(decode.toString());
  }



  @override
  Widget build(BuildContext context) {
    //Login details = Login();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              
              //Text(AuthUtility.userInfo.payload!.user!.name.toString())
            
            //    Text("User Id : ${AuthUtility.userInfo.payload!.user!.id}"),
             
            //    Text("User Name : ${AuthUtility.userInfo.payload!.user!.name}"),
            //   //Text(AuthUtility.userInfo.payload!.user!.name.toString()),
            //   Text("Email : ${AuthUtility.userInfo.payload!.user!.email}"),
            //  // Text(AuthUtility.userInfo.payload!.user!.email.toString()),
              
            //    Text("Created At : ${AuthUtility.userInfo.payload!.user!.createdAt}"),
            //   //Text(AuthUtility.userInfo.payload!.user!.createdAt.toString()),
            //   const Text("Email is"),
            //   Text(AuthUtility.userInfo.payload!.user!.email.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
