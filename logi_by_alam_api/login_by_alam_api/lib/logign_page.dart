import 'package:flutter/material.dart';
import 'package:login_by_alam_api/Network_Manager/network_caller.dart';
import 'package:login_by_alam_api/Network_Manager/network_response.dart';
import 'package:login_by_alam_api/model/auth_utility.dart';
import 'package:login_by_alam_api/model/login_model.dart';
import 'package:login_by_alam_api/user_details.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey();
  bool _loginInProgress = false;

  Future<void> login() async {
    _loginInProgress = true;
    if (mounted) setState(() {});
    NetworkResponse response = await NetworkCaller().postRequest(
        "https://task.teamrabbil.com/api/v1/login", <String, dynamic>{
      "email": _emailController.text.trim(),
      "password": _passwordController.text,
    });
    print(response.body);
    if (response.isSuccess) {
      LoginModel model = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(model);
    }
    print("From Auth Utility");
    print(AuthUtility.userInfo.data!.email);
    if (mounted) {
      setState(() {});
    }

    _loginInProgress = false;
    if (mounted) setState(() {});
    if (response.isSuccess) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => UserDetails()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _emailController,
          ),
          TextField(
            controller: _passwordController,
          ),
          SizedBox(
            width: double.infinity,
            child: Visibility(
              visible: _loginInProgress == false,
              replacement: const Center(child: CircularProgressIndicator()),
              child: ElevatedButton(
                onPressed: () {
                  login();
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
