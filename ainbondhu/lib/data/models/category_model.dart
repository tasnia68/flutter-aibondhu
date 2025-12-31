import 'package:flutter/material.dart';

class Category {
  final String title;
  final String description;
  final IconData icon; // Using IconData for simplicity in mock, typically string URL from API
  final Color color; // Typically hex string from API, here simple Color

  Category({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  // Factory to parse JSON (simulated)
  factory Category.fromJson(Map<String, dynamic> json) {
    // In real app, map string/int to IconData/Color
    return Category(
      title: json['title'],
      description: json['description'],
      icon: IconData(json['icon_code'], fontFamily: 'MaterialIcons'),
      color: Color(json['color_value']),
    );
  }
}
