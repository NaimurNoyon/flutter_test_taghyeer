import '../../core/services/network_caller.dart';
import '../datasource/product_remote_datasource.dart';
import '../models/product_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final NetworkCaller networkCaller;

  ProductRemoteDataSourceImpl(this.networkCaller);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await networkCaller.getRequest(
      "https://dummyjson.com/products",
    );

    if (response.success) {
      List list = response.data["products"];

      return list.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(response.message);
    }
  }
}
