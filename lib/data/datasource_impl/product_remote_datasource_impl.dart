import '../../core/services/network_caller.dart';
import '../datasource/product_remote_datasource.dart';
import '../models/product_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final NetworkCaller networkCaller;

  ProductRemoteDataSourceImpl(this.networkCaller);

  @override
  Future<List<ProductModel>> getProducts({int skip = 0, int limit = 10}) async {
    final response = await networkCaller.getRequest(
      "https://dummyjson.com/products?limit=$limit&skip=$skip",
    );

    if (response.success) {
      List list = response.data["products"];
      return list.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(response.message);
    }
  }
}
