// To parse this JSON data, do
//
//     final widgetInfo = widgetInfoFromJson(jsonString);

import 'dart:convert';

List<WidgetInfo> widgetInfoFromJson(String str) =>
    List<WidgetInfo>.from(json.decode(str).map((x) => WidgetInfo.fromJson(x)));

String widgetInfoToJson(List<WidgetInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WidgetInfo {
  int? version;
  String? title;
  String? description;
  String? author;
  String? email;
  int? width;
  int? height;
  int? xscreens;
  String? features;
  int? release;
  bool? locked;
  int? pflags;

  WidgetInfo({
    this.version,
    this.title,
    this.description,
    this.author,
    this.email,
    this.width,
    this.height,
    this.xscreens,
    this.features,
    this.release,
    this.locked,
    this.pflags,
  });

  factory WidgetInfo.fromJson(Map<String, dynamic> json) => WidgetInfo(
        version: json["version"],
        title: json["title"],
        description: json["description"],
        author: json["author"],
        email: json["email"],
        width: json["width"],
        height: json["height"],
        xscreens: json["xscreens"],
        features: json["features"],
        release: json["release"],
        locked: json["locked"],
        pflags: json["pflags"],
      );

  Map<String, dynamic> toJson() => {
        "version": version,
        "title": title,
        "description": description,
        "author": author,
        "email": email,
        "width": width,
        "height": height,
        "xscreens": xscreens,
        "features": features,
        "release": release,
        "locked": locked,
        "pflags": pflags,
      };
}
