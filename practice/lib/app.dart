import 'package:flutter/material.dart';
import 'package:practice/screens/splash_screen.dart';

class ShoppingApp extends StatelessWidget {
  const ShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 206, 193, 193),
          brightness: Brightness.light,
          primarySwatch: Colors.brown,
          inputDecorationTheme: const InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            filled: true,
            fillColor: Color.fromARGB(255, 224, 221, 221),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 27, letterSpacing: 0.6),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16)))),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}
