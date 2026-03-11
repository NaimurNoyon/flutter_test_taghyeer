import 'package:get/get.dart';
import '../../data/datasource/product_remote_datasource.dart';
import '../../data/datasource_impl/product_remote_datasource_impl.dart';
import '../../data/repository_impl/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/get_products.dart';
import '../../presentation/controllers/product_controller.dart';
import '../services/network_caller.dart';
import '../theme/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<NetworkCaller>(NetworkCaller(), permanent: true);

    // 1. DataSource (innermost dependency)
    Get.lazyPut<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(Get.find<NetworkCaller>()),
    );

    // 2. Repository (depends on DataSource)
    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(Get.find<ProductRemoteDataSource>()),
    );

    // 3. Use Case (depends on Repository)
    Get.lazyPut<GetProducts>(() => GetProducts(Get.find<ProductRepository>()));

    // 4. Controller (depends on Use Case)
    Get.lazyPut<ProductController>(
      () => ProductController(Get.find<GetProducts>()),
    );
  }
}
