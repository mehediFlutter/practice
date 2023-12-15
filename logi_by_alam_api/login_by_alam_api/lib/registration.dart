import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool registrationInProgress = false;
  TextEditingController _nameEDcontroller = TextEditingController();
  TextEditingController _emailEDcontroller = TextEditingController();
  TextEditingController _passwordEDcontroller = TextEditingController();
  TextEditingController _confirmPasswordEDcontroller = TextEditingController();

  void registration() async {
    registrationInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Response response =
        await post(Uri.parse("https://rm.guideasy.com/api/register"),
            headers: {"Content-Type": "application/vnd.api+json"},
            body: jsonEncode(<String, dynamic>{
              "name": _nameEDcontroller.text,
              "email": _emailEDcontroller.text,
              "password": _passwordEDcontroller.text,
              "password_confirmation": _confirmPasswordEDcontroller.text
            }));
            print("Registration status code is ");
            print(response.statusCode);
            print(response.body);
            Map<String,dynamic> decodedBody = jsonDecode(response.body);
            print(decodedBody['status']);
             registrationInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: _nameEDcontroller,
            decoration: 
            InputDecoration(hintText: 'Name'),
          ),
          TextField(
            controller: _emailEDcontroller,
            decoration: InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: _passwordEDcontroller,
            decoration: InputDecoration(hintText: 'Password'),
          ),
          TextField(
            controller: _confirmPasswordEDcontroller,
            decoration: InputDecoration(hintText: 'Confirm Password'),
          ),
          ElevatedButton(onPressed: () {
            registration();
          }, child: Text("Registrater")),
        ]),
      ),
    );
  }
}
