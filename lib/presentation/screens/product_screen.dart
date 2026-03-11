import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          !controller.isPaginationLoading &&
          controller.hasMore) {
        controller.fetchProducts(isInitial: false);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: GetBuilder<ProductController>(
        builder: (_) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.isError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Error: ${controller.errorMessage}"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: controller.retry,
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }

          if (controller.products.isEmpty) {
            return const Center(child: Text("No products found"));
          }

          return ListView.builder(
            controller: scrollController,
            itemCount:
                controller.products.length +
                (controller.isPaginationLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < controller.products.length) {
                final product = controller.products[index];
                return ListTile(
                  leading: Image.network(
                    product.thumbnail,
                    width: 50,
                    height: 50,
                  ),

                  title: Text(product.title),
                  subtitle: Text("\$${product.price}"),
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          );
        },
      ),
    );
  }
}
