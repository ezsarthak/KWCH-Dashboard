import 'dart:convert';
import 'dart:io';
import '../models/widget_info_model.dart';

class LoadWidgetDetail {
  static Future<List<WidgetInfo>> getwidgetinfo(String currentjson) async {
    final File file = File(currentjson);
    String text = await file.readAsString();
    List<WidgetInfo> parseJosn(String response) {
      final parsed =
          json.decode(response.toString()).cast<Map<String, dynamic>>();
      return parsed
          .map<WidgetInfo>((json) => WidgetInfo.fromJson(json))
          .toList();
    }

    return parseJosn(text);
  }
}
