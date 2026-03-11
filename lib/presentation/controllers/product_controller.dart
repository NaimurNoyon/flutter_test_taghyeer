import 'package:get/get.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';

class ProductController extends GetxController {
  final GetProducts getProductsUseCase;

  ProductController(this.getProductsUseCase);

  List<Product> products = [];
  bool isLoading = false;
  bool isPaginationLoading = false;
  bool isError = false;
  String errorMessage = '';
  int skip = 0;
  final int limit = 10;
  bool hasMore = true;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts({bool isInitial = true}) async {
    if (isInitial) {
      isLoading = true;
      skip = 0;
      hasMore = true;
      products.clear();
      update();
    } else {
      if (!hasMore || isPaginationLoading) return;
      isPaginationLoading = true;
      update();
    }

    try {
      final newProducts = await getProductsUseCase(skip: skip, limit: limit);
      if (newProducts.isEmpty) {
        hasMore = false;
      } else {
        products.addAll(newProducts);
        skip += limit;
      }
      isError = false;
    } catch (e) {
      isError = true;
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      isPaginationLoading = false;
      update();
    }
  }

  void retry() => fetchProducts();
}
