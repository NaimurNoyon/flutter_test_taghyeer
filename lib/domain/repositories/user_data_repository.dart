import '../../data/models/user_model.dart';

abstract class UserDataRepository {
  Future<UserModel?> getUser();
  Future<void> saveUser(UserModel user);
  Future<void> logout();
}
