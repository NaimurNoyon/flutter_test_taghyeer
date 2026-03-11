import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the Product entity from named route arguments
    final Product product = Get.arguments as Product;

    return Scaffold(
      appBar: AppBar(title: Text(product.title ?? "No Title")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Product Image
          product.thumbnail != null && product.thumbnail!.isNotEmpty
              ? Image.network(
                  product.thumbnail!,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported, size: 80),
                  ),
                )
              : Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.image_not_supported, size: 80),
                ),
          const SizedBox(height: 16),

          // Title & Price
          Text(
            product.title ?? "No Title",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text("\$${product.price}", style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 8),

          // Description
          Text(product.description ?? "No description available"),
          const SizedBox(height: 8),

          // Category, Brand, Stock, Rating
          Text("Category: ${product.category ?? "N/A"}"),
          Text("Brand: ${product.brand ?? "N/A"}"),
          Text("Stock: ${product.stock ?? "N/A"}"),
          Text("Rating: ${product.rating ?? "N/A"}"),
          const SizedBox(height: 16),

          // Reviews Section
          const Text("Reviews:", style: TextStyle(fontWeight: FontWeight.bold)),
          ...product.reviews.map(
            (review) => ListTile(
              title: Text(review.reviewerName ?? "Anonymous"),
              subtitle: Text(review.comment ?? ""),
              trailing: Text("${review.rating}/5"),
            ),
          ),
        ],
      ),
    );
  }
}
