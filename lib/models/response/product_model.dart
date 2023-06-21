// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);

// import 'dart:convert';

// Product productFromJson(String str) => Product.fromJson(json.decode(str));

// String productToJson(Product data) => json.encode(data.toJson());

// class Product {
//   List<ProductData> data;

//   Product({
//     required this.data,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         data: List<ProductData>.from(
//             json["data"].map((x) => ProductData.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class ProductData {
//   int id;
//   ProductDataAttributes attributes;

//   ProductData({
//     required this.id,
//     required this.attributes,
//   });

//   factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
//         id: json["id"],
//         attributes: ProductDataAttributes.fromJson(json["attributes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes.toJson(),
//       };
// }

// class ProductDataAttributes {
//   String title;
//   String price;
//   String rating;
//   String description;
//   String quantity;
//   Category category;
//   Thumbnail? thumbnail; // Make thumbnail nullable by adding "?" after the type

//   ProductDataAttributes({
//     required this.title,
//     required this.price,
//     required this.rating,
//     required this.description,
//     required this.quantity,
//     required this.category,
//     this.thumbnail, // Update the constructor to accept nullable thumbnail
//   });

//   factory ProductDataAttributes.fromJson(Map<String, dynamic> json) =>
//       ProductDataAttributes(
//         title: json["title"],
//         price: json["price"],
//         rating: json["rating"],
//         description: json["description"],
//         quantity: json["quantity"],
//         category: Category.fromJson(json["category"]),
//         thumbnail: json["thumbnail"] != null
//             ? Thumbnail.fromJson(json["thumbnail"])
//             : null, // Parse thumbnail only if it's not null
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "price": price,
//         "rating": rating,
//         "description": description,
//         "quantity": quantity,
//         "category": category.toJson(),
//         "thumbnail": thumbnail
//             ?.toJson(), // Convert thumbnail to JSON only if it's not null
//       };
// }

// class Category {
//   CategoryData data;

//   Category({
//     required this.data,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         data: CategoryData.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }

// class CategoryData {
//   int id;
//   CategoryDataAttributes attributes;

//   CategoryData({
//     required this.id,
//     required this.attributes,
//   });

//   factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
//         id: json["id"],
//         attributes: CategoryDataAttributes.fromJson(json["attributes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes.toJson(),
//       };
// }

// class CategoryDataAttributes {
//   String title;
//   String iconUrl;

//   CategoryDataAttributes({
//     required this.title,
//     required this.iconUrl,
//   });

//   factory CategoryDataAttributes.fromJson(Map<String, dynamic> json) =>
//       CategoryDataAttributes(
//         title: json["title"],
//         iconUrl: json["iconUrl"],
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "iconUrl": iconUrl,
//       };
// }

// class Thumbnail {
//   ThumbnailData data;

//   Thumbnail({
//     required this.data,
//   });

//   factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
//         data: ThumbnailData.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//       };
// }

// class ThumbnailData {
//   int id;
//   ThumbnailDataAttributes attributes;

//   ThumbnailData({
//     required this.id,
//     required this.attributes,
//   });

//   factory ThumbnailData.fromJson(Map<String, dynamic> json) => ThumbnailData(
//         id: json["id"],
//         attributes: ThumbnailDataAttributes.fromJson(json["attributes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes.toJson(),
//       };
// }

// class ThumbnailDataAttributes {
//   String name;
//   dynamic alternativeText;
//   dynamic caption;
//   String? url;

//   ThumbnailDataAttributes({
//     required this.name,
//     this.alternativeText,
//     this.caption,
//     this.url,
//   });

//   factory ThumbnailDataAttributes.fromJson(Map<String, dynamic> json) =>
//       ThumbnailDataAttributes(
//         name: json["name"],
//         alternativeText: json["alternativeText"],
//         caption: json["caption"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "alternativeText": alternativeText,
//         "caption": caption,
//         "url": url,
//       };
// }

// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

// import 'dart:convert';

// Product productFromJson(String str) => Product.fromJson(json.decode(str));

// String productToJson(Product data) => json.encode(data.toJson());

// class Product {
//   List<ProductData> data;

//   Product({
//     required this.data,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         data: List<ProductData>.from(
//             json["data"].map((x) => ProductData.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class ProductData {
//   int id;
//   ProductDataAttributes attributes;

//   ProductData({
//     required this.id,
//     required this.attributes,
//   });

//   factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
//         id: json["id"],
//         attributes: ProductDataAttributes.fromJson(json["attributes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes.toJson(),
//       };
// }

// class ProductDataAttributes {
//   String title;
//   String price;
//   String rating;
//   String? description;
//   String quantity;
//   Category? category;
//   Thumbnail? thumbnail;

//   ProductDataAttributes({
//     required this.title,
//     required this.price,
//     required this.rating,
//     this.description,
//     required this.quantity,
//     this.category,
//     this.thumbnail,
//   });

//   factory ProductDataAttributes.fromJson(Map<String, dynamic> json) =>
//       ProductDataAttributes(
//         title: json["title"],
//         price: json["price"],
//         rating: json["rating"],
//         description: json["description"],
//         quantity: json["quantity"],
//         category: Category.fromJson(json["category"]),
//         thumbnail: Thumbnail.fromJson(json["thumbnail"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "price": price,
//         "rating": rating,
//         "description": description,
//         "quantity": quantity,
//         "category": category!.toJson(),
//         "thumbnail": thumbnail!.toJson(),
//       };
// }

// class Category {
//   CategoryData? data;

//   Category({
//     this.data,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         data: CategoryData.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data!.toJson(),
//       };
// }

// class CategoryData {
//   int? id;
//   CategoryDataAttributes? attributes;

//   CategoryData({
//     this.id,
//     this.attributes,
//   });

//   factory CategoryData.fromJson(Map<String, dynamic> json) => CategoryData(
//         id: json["id"],
//         attributes: CategoryDataAttributes.fromJson(json["attributes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes!.toJson(),
//       };
// }

// class CategoryDataAttributes {
//   String? title;
//   String? iconUrl;

//   CategoryDataAttributes({
//     this.title,
//     this.iconUrl,
//   });

//   factory CategoryDataAttributes.fromJson(Map<String, dynamic> json) =>
//       CategoryDataAttributes(
//         title: json["title"],
//         iconUrl: json["iconUrl"],
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "iconUrl": iconUrl,
//       };
// }

// class Thumbnail {
//   ThumbnailData? data;

//   Thumbnail({
//     this.data,
//   });

//   factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
//         data: ThumbnailData.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "data": data!.toJson(),
//       };
// }

// class ThumbnailData {
//   int? id;
//   ThumbnailDataAttributes? attributes;

//   ThumbnailData({
//     this.id,
//     this.attributes,
//   });

//   factory ThumbnailData.fromJson(Map<String, dynamic> json) => ThumbnailData(
//         id: json["id"],
//         attributes: ThumbnailDataAttributes.fromJson(json["attributes"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "attributes": attributes!.toJson(),
//       };
// }

// class ThumbnailDataAttributes {
//   String? url;

//   ThumbnailDataAttributes({
//     this.url,
//   });

//   factory ThumbnailDataAttributes.fromJson(Map<String, dynamic> json) =>
//       ThumbnailDataAttributes(
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//       };
// }

// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    List<ProductData> data;

    Product({
        required this.data,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: List<ProductData>.from(json["data"].map((x) => ProductData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class ProductData {
    int id;
    ProductDataAttributes attributes;

    ProductData({
        required this.id,
        required this.attributes,
    });

    factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        attributes: ProductDataAttributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes.toJson(),
    };
}

class ProductDataAttributes {
    String title;
    String price;
    String rating;
    String description;
    String quantity;
    Category category;

    ProductDataAttributes({
        required this.title,
        required this.price,
        required this.rating,
        required this.description,
        required this.quantity,
        required this.category,
    });

    factory ProductDataAttributes.fromJson(Map<String, dynamic> json) => ProductDataAttributes(
        title: json["title"],
        price: json["price"],
        rating: json["rating"],
        description: json["description"],
        quantity: json["quantity"],
        category: Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "rating": rating,
        "description": description,
        "quantity": quantity,
        "category": category.toJson(),
    };
}

class Category {
    CategoryData data;

    Category({
        required this.data,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        data: CategoryData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
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
