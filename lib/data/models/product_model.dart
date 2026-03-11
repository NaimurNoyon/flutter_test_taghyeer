import '../../domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    super.title,
    super.description,
    super.category,
    super.price,
    super.discountPercentage,
    super.rating,
    super.stock,
    super.tags,
    super.brand,
    super.sku,
    super.weight,
    super.dimensions,
    super.warrantyInformation,
    super.shippingInformation,
    super.availabilityStatus,
    super.reviews,
    super.returnPolicy,
    super.minimumOrderQuantity,
    super.meta,
    super.images,
    super.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "No Title",
      description: json["description"] ?? "",
      category: json["category"] ?? "",
      price: (json["price"] != null) ? (json["price"] as num).toDouble() : 0,
      discountPercentage: (json["discountPercentage"] != null)
          ? (json["discountPercentage"] as num).toDouble()
          : 0,
      rating: (json["rating"] != null) ? (json["rating"] as num).toDouble() : 0,
      stock: json["stock"] ?? 0,
      tags: (json["tags"] != null) ? List<String>.from(json["tags"]) : [],
      brand: json["brand"] ?? "",
      sku: json["sku"] ?? "",
      weight: (json["weight"] != null) ? (json["weight"] as num).toDouble() : 0,
      dimensions: json["dimensions"] != null
          ? Dimensions(
              width: (json["dimensions"]["width"] as num?)?.toDouble(),
              height: (json["dimensions"]["height"] as num?)?.toDouble(),
              depth: (json["dimensions"]["depth"] as num?)?.toDouble(),
            )
          : null,
      warrantyInformation: json["warrantyInformation"] ?? "",
      shippingInformation: json["shippingInformation"] ?? "",
      availabilityStatus: json["availabilityStatus"] ?? "",
      reviews: (json["reviews"] != null)
          ? (json["reviews"] as List)
                .map(
                  (e) => Review(
                    rating: e["rating"] ?? 0,
                    comment: e["comment"] ?? "",
                    date: e["date"] ?? "",
                    reviewerName: e["reviewerName"] ?? "",
                    reviewerEmail: e["reviewerEmail"] ?? "",
                  ),
                )
                .toList()
          : [],
      returnPolicy: json["returnPolicy"] ?? "",
      minimumOrderQuantity: json["minimumOrderQuantity"] ?? 0,
      meta: json["meta"] != null
          ? Meta(
              createdAt: json["meta"]["createdAt"] ?? "",
              updatedAt: json["meta"]["updatedAt"] ?? "",
              barcode: json["meta"]["barcode"] ?? "",
              qrCode: json["meta"]["qrCode"] ?? "",
            )
          : null,
      images: (json["images"] != null) ? List<String>.from(json["images"]) : [],
      thumbnail: json["thumbnail"] ?? "",
    );
  }
}
