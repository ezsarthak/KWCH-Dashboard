import 'dart:convert';

List<WallModel> romModelFromJson(String str) =>
    List<WallModel>.from(json.decode(str).map((x) => WallModel.fromJson(x)));
String romModelToJson(List<WallModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WallModel {
  WallModel({
    this.name,
    this.category,
    this.url,
    this.auther,
    this.thumb,
  });
  String? name;
  String? auther;

  String? category;
  String? url;
  String? thumb;

  factory WallModel.fromJson(Map<String, dynamic> json) => WallModel(
        name: json["name"],
        auther: json["author"],
        category: json["collections"],
        url: json["url"],
        thumb: json["thumbnail"],
      );
  Map<String, dynamic> toJson() => {
        "name": name,
        "author": auther,
        "url": url,
        "thumbnail": thumb,
        "collections": category,
      };
}
