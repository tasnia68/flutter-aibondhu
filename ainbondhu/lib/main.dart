
import 'package:ainbondhu/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AinBondhu',
      theme: ThemeData(
        primaryColor: const Color(0xFFD0BB95),
        fontFamily: 'Manrope',
      ),
      home: const LoginScreen(),
    );
  }
}
