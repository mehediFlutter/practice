import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            
            ),
            child: Padding(padding: EdgeInsets.all(8),
            child: IntlPhoneField(
              decoration: const InputDecoration(
                
              ),
              
            ),
            ),
          ),
        )),
      ),
    );
  }
}
