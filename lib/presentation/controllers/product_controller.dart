import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';

class ProductController extends GetxController {
  final GetProducts getProductsUseCase;

  ProductController(this.getProductsUseCase);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  List<Product> products = [];

  Future<void> fetchProducts() async {
    products.clear();
    products = await getProductsUseCase();
    update();
  }
}
