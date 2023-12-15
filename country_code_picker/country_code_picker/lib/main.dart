import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
void main(){
  runApp(CountryCode());
}

class CountryCode extends StatefulWidget {
  const CountryCode({super.key});

  @override
  State<CountryCode> createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(onPressed: (){}, child: Text("tap"))


        ],
      ),
    );
  }
}