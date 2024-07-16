// To parse this JSON data, do
//
//     final blogListData = blogListDataFromJson(jsonString);

import 'dart:convert';

List<BlogListData> blogListDataFromJson(String str) => List<BlogListData>.from(json.decode(str).map((x) => BlogListData.fromJson(x)));

String blogListDataToJson(List<BlogListData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BlogListData {
    int userId;
    int id;
    String title;
    String body;

    BlogListData({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory BlogListData.fromJson(Map<String, dynamic> json) => BlogListData(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
