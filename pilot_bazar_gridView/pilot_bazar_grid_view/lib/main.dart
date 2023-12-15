import 'package:flutter/material.dart';

void main() {
  runApp(GredViewClass());
}

class GredViewClass extends StatefulWidget {
  const GredViewClass({super.key});

  @override
  State<GredViewClass> createState() => _GredViewClassState();
}

class _GredViewClassState extends State<GredViewClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
                itemCount: 20,
            itemBuilder: (context,index){
              return ListTile(
                onTap: () {
                  print(index);
                },
                title: Text("left"),
                
              );
            }),
      )),
    );
  }
}
