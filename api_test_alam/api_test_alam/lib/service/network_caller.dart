import 'dart:convert';
import 'package:api_test_alam/api.dart';
import 'package:api_test_alam/login.dart';
import 'package:api_test_alam/service/auth_utility.dart';
import 'package:api_test_alam/service/network_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url), headers: {
        //'token': AuthUtility.userInfo.payload!.token.toString(),
        //'Accept': 'application/vnd.api+json',
        //'Content-Type': 'application/vnd.api+json'
      });
      if (response.statusCode == 200) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else if ((response.statusCode == 401) ||  (response.statusCode==-1)) {
        gotoLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      print(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  // Post()

  Future<NetworkResponse> postRequest(String url, Map<String,dynamic> body) async {
    try {
      Response response = await post(Uri.parse(url), body: jsonEncode(body),
      headers: {
        //'token': AuthUtility.userInfo.payload!.token.toString(),
        //'Accept': 'application/vnd.api+json',
        //'Content-Type': 'application/vnd.api+json'
      });
      if (response.statusCode == 200) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else if ((response.statusCode == 401) ||  (response.statusCode==-1)) {
        gotoLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      print(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }


  void gotoLogin() {
    Navigator.pushAndRemoveUntil(TestAPI.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }

  // Future<void> gotoLogin() async {
  //   await AuthUtility.clearUserInfo();

  //   Navigator.pushAndRemoveUntil(
  //       TaskManagerApp.globalKey.currentContext!,
  //       MaterialPageRoute(builder: (context) => LoginScreen()),
  //       (route) => false);
  // }
}
