import 'package:flutter_test_taghyeer/core/services/network_caller.dart';
import 'package:get/get.dart';

import '../../data/datasource/product_remote_datasource.dart';
import '../../data/datasource/user_local_datasource.dart';
import '../../data/datasource_impl/product_remote_datasource_impl.dart';
import '../../data/repository_impl/product_repository_impl.dart';
import '../../data/repository_impl/user_data_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/repositories/user_data_repository.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/get_user_data.dart';
import '../../presentation/controllers/product_controller.dart';
import '../../presentation/controllers/user_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    /// PRODUCT
    Get.lazyPut<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(Get.find<NetworkCaller>()),
    );

    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(Get.find<ProductRemoteDataSource>()),
    );

    Get.lazyPut<GetProducts>(() => GetProducts(Get.find<ProductRepository>()));

    Get.put<ProductController>(
      ProductController(Get.find<GetProducts>()),
      permanent: true,
    );

    /// POSTS (future)
  }
}
