// To parse this JSON data, do
//
//     final unitWise = unitWiseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UnitWise unitWiseFromJson(String str) => UnitWise.fromJson(json.decode(str));

String unitWiseToJson(UnitWise data) => json.encode(data.toJson());

class UnitWise {
  final bool success;
  final int count;
  final String message;
  final List<Product> product;

  UnitWise({
    required this.success,
    required this.count,
    required this.message,
    required this.product,
  });

  UnitWise copyWith({
    bool? success,
    int? count,
    String? message,
    List<Product>? product,
  }) =>
      UnitWise(
        success: success ?? this.success,
        count: count ?? this.count,
        message: message ?? this.message,
        product: product ?? this.product,
      );

  factory UnitWise.fromJson(Map<String, dynamic> json) => UnitWise(
        success: json["success"],
        count: json["count"],
        message: json["message"],
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "count": count,
        "message": message,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

class Product {
  final String id;
  final String title;
  final String discription;
  final String chapterid;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Product({
    required this.id,
    required this.title,
    required this.discription,
    required this.chapterid,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  Product copyWith({
    String? id,
    String? title,
    String? discription,
    String? chapterid,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        discription: discription ?? this.discription,
        chapterid: chapterid ?? this.chapterid,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        title: json["title"],
        discription: json["discription"],
        chapterid: json["chapterid"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "discription": discription,
        "chapterid": chapterid,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
