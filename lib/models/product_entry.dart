// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String model;
    String pk;
    Fields fields;

    ProductEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String brand;
    String productName;
    int price;
    String description;
    String category;
    int ratings;

    Fields({
        required this.user,
        required this.brand,
        required this.productName,
        required this.price,
        required this.description,
        required this.category,
        required this.ratings,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        brand: json["brand"],
        productName: json["product_name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        ratings: json["ratings"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "brand": brand,
        "product_name": productName,
        "price": price,
        "description": description,
        "category": category,
        "ratings": ratings,
    };
}