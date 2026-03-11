import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Screen')),
      body: GetBuilder<ProductController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              if (controller.products.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return ListTile(
                  title: Text(controller.products[index].title),
                  subtitle: Text(controller.products[index].price.toString()),
                  leading: const Icon(Icons.shopping_bag),
                  onTap: () {
                    // Handle product tap
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
