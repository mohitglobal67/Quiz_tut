// To parse this JSON data, do
//
//     final homepage = homepageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Homepage homepageFromJson(String str) => Homepage.fromJson(json.decode(str));

String homepageToJson(Homepage data) => json.encode(data.toJson());

class Homepage {
  final bool success;
  final String message;
  final int total;
  final List<Catagory> catagory;

  Homepage({
    required this.success,
    required this.message,
    required this.total,
    required this.catagory,
  });

  Homepage copyWith({
    bool? success,
    String? message,
    int? total,
    List<Catagory>? catagory,
  }) =>
      Homepage(
        success: success ?? this.success,
        message: message ?? this.message,
        total: total ?? this.total,
        catagory: catagory ?? this.catagory,
      );

  factory Homepage.fromJson(Map<String, dynamic> json) => Homepage(
        success: json["success"],
        message: json["message"],
        total: json["total"],
        catagory: List<Catagory>.from(
            json["catagory"].map((x) => Catagory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "total": total,
        "catagory": List<dynamic>.from(catagory.map((x) => x.toJson())),
      };
}

class Catagory {
  final String id;
  final String category;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Catagory({
    required this.id,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Catagory copyWith({
    String? id,
    String? category,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      Catagory(
        id: id ?? this.id,
        category: category ?? this.category,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Catagory.fromJson(Map<String, dynamic> json) => Catagory(
        id: json["_id"],
        category: json["category"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "category": category,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
