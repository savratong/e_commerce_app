// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  List<ProductData>? data;

  Product({
    this.data,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: json["data"] == null
            ? []
            : List<ProductData>.from(
                json["data"]!.map((x) => ProductData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class ProductData {
  int? id;
  ProductDataAttributes? attributes;

  ProductData({
    this.id,
    this.attributes,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : ProductDataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class ProductDataAttributes {
  String? title;
  String? price;
  String? rating;
  String? description;
  String? quantity;
  Category? category;
  Thumbnail? thumbnail;

  ProductDataAttributes({
    this.title,
    this.price,
    this.rating,
    this.description,
    this.quantity,
    this.category,
    this.thumbnail,
  });

  factory ProductDataAttributes.fromJson(Map<String, dynamic> json) =>
      ProductDataAttributes(
        title: json["title"],
        price: json["price"],
        rating: json["rating"],
        description: json["description"],
        quantity: json["quantity"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "rating": rating,
        "description": description,
        "quantity": quantity,
        "category": category?.toJson(),
        "thumbnail": thumbnail?.toJson(),
      };
}

class Category {
  CategoryData? data;

  Category({
    this.data,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        data: json["data"] == null ? null : CategoryData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class CategoryData {
  int? id;
  CategoryDataAttributes? attributes;

  CategoryData({
    this.id,
    this.attributes,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : CategoryDataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class CategoryDataAttributes {
  String? title;

  String? iconUrl;

  CategoryDataAttributes({
    this.title,
    this.iconUrl,
  });

  factory CategoryDataAttributes.fromJson(Map<String, dynamic> json) =>
      CategoryDataAttributes(
        title: json["title"],
        iconUrl: json["iconUrl"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "iconUrl": iconUrl,
      };
}

class Thumbnail {
  ThumbnailData? data;

  Thumbnail({
    this.data,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        data:
            json["data"] == null ? null : ThumbnailData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class ThumbnailData {
  int? id;
  ThumbnailDataAttributes? attributes;

  ThumbnailData({
    this.id,
    this.attributes,
  });

  factory ThumbnailData.fromJson(Map<String, dynamic> json) => ThumbnailData(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : ThumbnailDataAttributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };
}

class ThumbnailDataAttributes {
  String? url;

  ThumbnailDataAttributes({
    this.url,
  });

  factory ThumbnailDataAttributes.fromJson(Map<String, dynamic> json) =>
      ThumbnailDataAttributes(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
