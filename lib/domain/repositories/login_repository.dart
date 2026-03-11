import '../entities/user.dart';

abstract class LoginRepository {
  Future<User> login({required String username, required String password});
}
