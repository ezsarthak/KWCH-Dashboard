// To parse this JSON data, do
//
//     final appsModel = appsModelFromJson(jsonString);

import 'dart:convert';

List<AppsModel> appsModelFromJson(String str) =>
    List<AppsModel>.from(json.decode(str).map((x) => AppsModel.fromJson(x)));

String appsModelToJson(List<AppsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AppsModel {
  final String? link;
  final String? banner;

  AppsModel({
    required this.link,
    required this.banner,
  });

  factory AppsModel.fromJson(Map<String, dynamic> json) => AppsModel(
        link: json["link"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "banner": banner,
      };
}
