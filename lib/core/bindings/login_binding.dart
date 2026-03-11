import 'package:flutter_test_taghyeer/data/datasource/login_remote_datasource.dart';
import 'package:get/get.dart';
import '../../data/datasource/user_local_datasource.dart';
import '../../data/datasource_impl/login_remote_datasource_impl.dart';
import '../../data/repository_impl/login_repository_impl.dart';
import '../../domain/repositories/login_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../presentation/controllers/login_controller.dart';
import '../services/network_caller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // 1. DataSource (innermost dependency)
    Get.lazyPut<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(Get.find<NetworkCaller>()),
    );

    // 2. Repository (depends on DataSource)
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(
        Get.find<LoginRemoteDataSource>(),
        Get.find<UserLocalDataSource>(),
      ),
    );

    // 3. Use Case (depends on Repository)
    Get.lazyPut<LoginUser>(() => LoginUser(Get.find<LoginRepository>()));

    // 4. Controller (depends on Use Case)
    Get.lazyPut<LoginController>(() => LoginController(Get.find<LoginUser>()));
  }
}
