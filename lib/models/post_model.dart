import 'dart:convert';

class ToDoModel {
  String title;

  String id;

  ToDoModel({
    required this.title,
    required this.id,
  });

  factory ToDoModel.fromRawJson(String str) =>
      ToDoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        title: json["title"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "id": id,
      };
}
