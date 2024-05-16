import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static Future<bool> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, value);
  }

  static Future<bool> saveMap(String key, Map<String, dynamic> value) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.setString(key, jsonEncode(value));
  }

  static Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) ?? '';
  }

  static Future<Map<String, dynamic>> getMap(String key) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonString = prefs.getString(key) ?? '{}';

    return jsonDecode(jsonString);
  }

  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.remove(key);
  }
}
