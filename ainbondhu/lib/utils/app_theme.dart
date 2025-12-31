import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFD0BB95);
  static const Color background = Color(0xFFF7F7F6);
  static const Color backgroundLight = Color(0xFFFFFDD0);
  static const Color textPrimary = Color(0xFF2A3441);
  static const Color textSecondary = Colors.grey;
  static const Color white = Colors.white;
}

class AppTextStyles {
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: 'Manrope',
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w800,
    fontFamily: 'Manrope',
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: 'Manrope',
    color: AppColors.textPrimary,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Manrope',
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    fontFamily: 'Manrope',
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontFamily: 'Manrope',
    color: AppColors.textPrimary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontFamily: 'Manrope',
    color: AppColors.textSecondary,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontFamily: 'Manrope',
    color: AppColors.textSecondary,
  );
}
