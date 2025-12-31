import 'package:ainbondhu/login_screen.dart';
import 'package:ainbondhu/utils/app_theme.dart';
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
        primaryColor: AppColors.primary,
        fontFamily: 'Manrope',
        scaffoldBackgroundColor: AppColors.background,
      ),
      home: const LoginScreen(),
    );
  }
}
