// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    List<CategoryData> data;

    Category({
        required this.data,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        data: List<CategoryData>.from(json["data"].map((x) => CategoryData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class CategoryData {
    int id;
    CategoryDataAttributes attributes;

    CategoryData({
        required this.id,
        required this.attributes,
    });

    factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"],
        attributes: CategoryDataAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class CategoryDataAttributes {
    String title;
    String iconUrl;

    CategoryDataAttributes({
        required this.title,
        required this.iconUrl,
    });

    factory CategoryDataAttributes.fromJson(Map<String, dynamic> json) => CategoryDataAttributes(
        title: json["title"],
        iconUrl: json["iconUrl"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "iconUrl": iconUrl,
    };
}
