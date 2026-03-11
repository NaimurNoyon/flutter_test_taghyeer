import 'package:get/get.dart';

import '../../data/models/user_model.dart';
import '../../domain/usecases/get_user_data.dart';

class UserDataController extends GetxController {
  final GetUserUseCase getUserUseCase;

  UserDataController(this.getUserUseCase);

  UserModel? user;

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  Future<void> loadUser() async {
    user = await getUserUseCase();
    update();
  }
}
