import 'package:ainbondhu/data/models/category_model.dart';
import 'package:ainbondhu/data/network/api_client.dart';
import 'package:flutter/material.dart';
import 'package:ainbondhu/utils/app_theme.dart';

class CategoryService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Category>> getCategories() async {
    // Mock API Call
    // final response = await _apiClient.get('/categories');

    await Future.delayed(const Duration(seconds: 1)); // Simulate latency

    // Mock Data simulating JSON response
    final List<Map<String, dynamic>> mockData = [
      {
        'title': 'পারিবারিক',
        'description': 'বিবাহ, তালাক, ভরণপোষণ ও অভিভাবকত্ব',
        'icon_code': 0xf06b, // Icons.family_restroom
        'color_value': 0xFFFF7043 // AppColors.primary (approx)
      },
      {
        'title': 'জমি ও সম্পত্তি',
        'description': 'নামজারি, দখল, রেজিস্ট্রেশন ও বন্টন',
        'icon_code': 0xe35f, // Icons.landscape
        'color_value': 0xFF2196F3 // Colors.blue
      },
      {
        'title': 'ফৌজদারি',
        'description': 'মামলা, জামিন, জিডি ও পুলিশি সহায়তা',
        'icon_code': 0xf0a3, // Icons.gavel
        'color_value': 0xFFF44336 // Colors.red
      },
      {
        'title': 'চেক ও অর্থ',
        'description': 'চেক ডিজঅনার, লোন ও আর্থিক লেনদেন',
        'icon_code': 0xe481, // Icons.payments
        'color_value': 0xFF4CAF50 // Colors.green
      },
      {
        'title': 'দলিল ও চুক্তি',
        'description': 'চুক্তিপত্র, হলফনামা ও লিগ্যাল নোটিশ',
        'icon_code': 0xe1db, // Icons.description
        'color_value': 0xFF9C27B0 // Colors.purple
      },
      {
        'title': 'সাইবার অপরাধ',
        'description': 'হ্যাকিং, ব্ল্যাকমেইল ও ডিজিটাল নিরাপত্তা',
        'icon_code': 0xe57c, // Icons.security
        'color_value': 0xFF00BCD4 // Colors.cyan
      },
      {
        'title': 'ব্যবসা ও কোম্পানি',
        'description': 'ট্রেড লাইসেন্স, কোম্পানি গঠন ও ভ্যাট',
        'icon_code': 0xe60f, // Icons.storefront
        'color_value': 0xFFFF9800 // Colors.orange
      },
      {
        'title': 'অন্যান্য',
        'description': 'অন্য যেকোনো আইনি পরামর্শ',
        'icon_code': 0xe402, // Icons.more_horiz
        'color_value': 0xFF9E9E9E // Colors.grey
      },
    ];

    return mockData.map((e) => Category.fromJson(e)).toList();
  }
}
