
import 'package:api_test_alam/model/login_model.dart';
import 'package:api_test_alam/registration.dart';
import 'package:api_test_alam/service/auth_utility.dart';
import 'package:api_test_alam/service/network_caller.dart';
import 'package:api_test_alam/service/network_response.dart';
import 'package:api_test_alam/task/task_index_details.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //navigateLoginOrHomePage();
  }

  Future<void> navigateLoginOrHomePage() async {
    final bool isUserLoggedIn = await AuthUtility.checkIfUserLoggedIn();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) =>
                isUserLoggedIn ? TaskIndexDetails() : Login()),
        (route) => false);
  }


  bool _loginInProgress = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> login() async {
    _loginInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response = await NetworkCaller().postRequest(
        "https://rm.guideasy.com/api/login", <String, dynamic>{
      "email": _emailController.text.trim(),
      "password": _passwordController.text
    });
    _loginInProgress = false;
    if (mounted) {
      setState(() {});
    }

    print(" login status code is ");
    
    print(response.statusCode);
    if(response.isSuccess){
      LoginModel model = LoginModel.fromJson(response.body!);
      await AuthUtility.saveUserInfo(model);
      if(mounted){
        print("User Status is ");
        print(AuthUtility.userInfo.status);
      }

    }
   
      
      print(response.body!);
      print("Token is");
      print(AuthUtility.userInfo.payload?.token);
      print("Status is");
      print(AuthUtility.userInfo.status.toString());
      print("Name is");
      print(AuthUtility.userInfo.payload!.user?.name.toString());
      print("Email is");
      print(AuthUtility.userInfo.payload?.user?.email);

      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Success")));
   
  }

// hassandevbd@gmail.com
  @override
  Widget build(BuildContext context) {
    //String name =AuthUtility.userInfo.payload!.user!.name.toString();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'email'),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'password'),
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: _loginInProgress == false,
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      login();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>  TaskIndexDetails()));
                    },
                    child: const Text("Login")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have Account? "),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Registration()));
                      },
                      child: const Text("Registration")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
