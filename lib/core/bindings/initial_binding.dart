import 'package:get/get.dart';
import '../../data/datasource/user_local_datasource.dart';
import '../../data/datasource_impl/user_local_datasource_imple.dart';
import '../../data/repository_impl/user_data_repository_impl.dart';
import '../../domain/repositories/user_data_repository.dart';
import '../../domain/usecases/get_user_data.dart';
import '../../presentation/controllers/user_controller.dart';
import '../services/network_caller.dart';
import '../theme/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<NetworkCaller>(NetworkCaller(), permanent: true);

    /// Local DataSource
    Get.put<UserLocalDataSource>(UserLocalDataSourceImpl(), permanent: true);

    /// Repository
    Get.put<UserDataRepository>(
      UserDataRepositoryImpl(Get.find<UserLocalDataSource>()),
      permanent: true,
    );

    /// UseCase
    Get.put<GetUserUseCase>(
      GetUserUseCase(Get.find<UserDataRepository>()),
      permanent: true,
    );

    /// Controller
    Get.put<UserDataController>(
      UserDataController(Get.find<GetUserUseCase>()),
      permanent: true,
    );
  }
}
