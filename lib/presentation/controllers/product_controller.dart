import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';

class ProductController {
  final GetProducts getProductsUseCase;

  ProductController(this.getProductsUseCase);

  Future<List<Product>> fetchProducts() async {
    return await getProductsUseCase();
  }
}
