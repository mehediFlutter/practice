import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login_by_alam_api/model/auth_utility.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(AuthUtility.userInfo.data!.firstName.toString()),
          Text(
            '${AuthUtility.userInfo.data!.firstName.toString()} ${AuthUtility.userInfo.data!.lastName.toString()}',
            style: const TextStyle(fontSize: 15, ),
          ),
          Text("Text"),
          Text(AuthUtility.userInfo.data!.email.toString()),
          Text(AuthUtility.userInfo.data!.firstName.toString()),
          Text(
            '${AuthUtility.userInfo.data?.firstName.toString()} ${AuthUtility.userInfo.data?.lastName.toString()}',
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
