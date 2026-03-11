import '../entities/user.dart';
import '../repositories/login_repository.dart';

class LoginUser {
  final LoginRepository repository;

  LoginUser(this.repository);

  Future<User> call({required String username, required String password}) {
    return repository.login(username: username, password: password);
  }
}
