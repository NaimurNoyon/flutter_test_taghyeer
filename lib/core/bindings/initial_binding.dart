import 'package:get/get.dart';
import '../services/network_caller.dart';
import '../theme/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ThemeController>(ThemeController(), permanent: true);
    Get.put<NetworkCaller>(NetworkCaller(), permanent: true);
  }
}
