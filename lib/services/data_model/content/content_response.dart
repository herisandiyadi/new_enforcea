// To parse this JSON data, do
//
//     final contentResponse = contentResponseFromJson(jsonString);

import 'dart:convert';

ContentResponse contentResponseFromJson(String str) =>
    ContentResponse.fromJson(json.decode(str));

String contentResponseToJson(ContentResponse data) =>
    json.encode(data.toJson());

class ContentResponse {
  ContentResponse({
    required this.success,
    required this.data,
  });

  bool success;
  List<Datum> data;

  factory ContentResponse.fromJson(Map<String, dynamic> json) =>
      ContentResponse(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.titleEn,
    required this.titleId,
    required this.icon,
    required this.postedDate,
  });

  int id;
  String titleEn;
  String titleId;
  String icon;
  String postedDate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        titleEn: json["title_en"],
        titleId: json["title_id"],
        icon: json["icon"],
        postedDate: json["posted_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title_en": titleEn,
        "title_id": titleId,
        "icon": icon,
        "posted_date": postedDate,
      };
}
