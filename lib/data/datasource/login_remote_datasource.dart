import '../models/user_model.dart';

abstract class LoginRemoteDataSource {
  Future<UserModel> login({required String username, required String password});
}
