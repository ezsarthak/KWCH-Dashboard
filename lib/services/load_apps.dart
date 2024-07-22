import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/apps_model.dart';
import '../setup/app_config.dart';

class AppApi {
  static Future<List<AppsModel>> getApps() async {
    final response = await http.get(Uri.parse(appsLink));
    // debugPrint("URL: ${Uri.encodeFull(wallUrl)}");

    if (response.statusCode == 200) {
      debugPrint('Response Code : ${response.statusCode}');
      // debugPrint('Wall Data: $data');
      final List wallsList = json.decode(response.body);
      return wallsList.map((json) => AppsModel.fromJson(json)).toList();
    } else {
      debugPrint('Response Code : ${response.statusCode}');
      throw Exception('Failed to load data');
    }
  }
}
