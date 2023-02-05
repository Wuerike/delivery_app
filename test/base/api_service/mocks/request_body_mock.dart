import 'dart:convert';

class PostBody {
  PostBody({
    this.title,
    this.body,
    this.userId,
  });

  String? title;
  String? body;
  int? userId;

  factory PostBody.fromJson(String str) => PostBody.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PostBody.fromMap(Map<String, dynamic> json) => PostBody(
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "body": body,
        "userId": userId,
      };
}

class PutBody {
  PutBody({
    this.id,
    this.title,
    this.body,
    this.userId,
  });

  int? id;
  String? title;
  String? body;
  int? userId;

  factory PutBody.fromJson(String str) => PutBody.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PutBody.fromMap(Map<String, dynamic> json) => PutBody(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
      };
}
