import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/check_in_data.dart';

class StorageService {
  static const String _key = 'check_in_data';
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  Future<List<CheckInData>> getCheckInData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? data = prefs.getString(_key);
    if (data == null) return [];

    final List<dynamic> jsonList = json.decode(data);
    return jsonList.map((json) => CheckInData.fromJson(json)).toList();
  }

  Future<void> saveCheckInData(CheckInData data) async {
    final prefs = await SharedPreferences.getInstance();
    final List<CheckInData> existingData = await getCheckInData();
    existingData.add(data);

    final List<Map<String, dynamic>> jsonList =
        existingData.map((item) => item.toJson()).toList();
    await prefs.setString(_key, json.encode(jsonList));
  }
}
