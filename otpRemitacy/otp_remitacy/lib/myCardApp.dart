import 'package:flutter/material.dart';

class MyCardApp extends StatefulWidget {
  @override
  _MyCardAppState createState() => _MyCardAppState();
}

class _MyCardAppState extends State<MyCardApp> {
  bool isCardSelected = false;

  void _toggleCardBorder() {
    setState(() {
      isCardSelected = !isCardSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Click the Card'),
      ),
      body: Center(
        child: InkWell(

          onTap: _toggleCardBorder,
          child: Card(
            elevation: isCardSelected ? 8 : 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: isCardSelected ? Colors.red : Colors.blue,
                width: isCardSelected ? 4.0 : 1.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Click me!',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}