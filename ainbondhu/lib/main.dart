import 'package:ainbondhu/login_screen.dart';
import 'package:ainbondhu/providers/auth_provider.dart';
import 'package:ainbondhu/providers/category_provider.dart';
import 'package:ainbondhu/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AinBondhuApp());
}

class AinBondhuApp extends StatelessWidget {
  const AinBondhuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        title: 'AinBondhu',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const LoginScreen(),
      ),
    );
  }
}
