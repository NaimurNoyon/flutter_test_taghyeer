import '../entities/product.dart';
import '../repositories/product_repository.dart';

class GetProducts {
  final ProductRepository repository;

  GetProducts(this.repository);

  Future<List<Product>> call({int skip = 0, int limit = 10}) async {
    return await repository.getProducts(skip: skip, limit: limit);
  }
}
