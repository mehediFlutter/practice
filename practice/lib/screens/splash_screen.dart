import 'package:flutter/material.dart';
import 'package:practice/screens/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatorToLogin();
  }

  void navigatorToLogin() {
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            // child: SvgPicture.asset(
            //   "assets/images/b.svg",
            //   fit: BoxFit.fill,
            // ),
          ),
          Center(
            child: Image.asset(
              "assets/images/shoppingBag-removebg-preview.png",
              width: 500,
            ),
          ),
        ],
      ),
    );
  }
}
