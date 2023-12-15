import 'dart:convert';
import 'package:api_test_alam/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _signUpInprogress = false;

  void registration() async {
    _signUpInprogress = true;
    if (mounted) {
      setState(() {});
    }
    Response response =
        await post(Uri.parse("https://rm.guideasy.com/api/register"),
            headers: {
              'Content-Type': 'application/vnd.api+json',
              'Accept':'application/vnd.api+json'
            },
            body: jsonEncode(
              {
                "name":_nameController.text.trim(),
                "email": _emailController.text.trim(),
                "password": _passwordController.text,
                "password_confirmation":_confirmPasswordController.text,
              },
            ));
    _signUpInprogress = false;
    if (mounted) {
      setState(() {});
    }
    //print(response.body.toString());
    print("Status Code is ");
    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registration Successfull")));
      //_emailController.clear();
      //_passwordController.clear();
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Registration Faild")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("API Test"),
                const TextField(),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      hintText: 'name', border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'email', border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'pasword', border: OutlineInputBorder()),
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      hintText: 'confirm pasword', border: OutlineInputBorder()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Visibility(
                    visible: _signUpInprogress==false,
                    replacement: const Center(child: CircularProgressIndicator(),),

                    child: ElevatedButton(
                        onPressed: () {
                          registration();
                        }, child: const Text("Registration")),
                  ),
                ),
                
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                }, child: const Text("Login"))
              ],
            ),
          ),
        ),
      );
  }
}