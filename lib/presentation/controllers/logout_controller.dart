import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';
import '../../domain/usecases/logout_usecase.dart';

class LogoutController extends GetxController {
  final LogoutUser logoutUser;

  LogoutController(this.logoutUser);

  void logout() {
    logoutUser();
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
