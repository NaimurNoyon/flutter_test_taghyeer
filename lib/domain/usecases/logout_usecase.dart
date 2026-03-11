import 'package:flutter_test_taghyeer/domain/repositories/user_data_repository.dart';

class LogoutUser {
  final UserDataRepository repository;
  LogoutUser(this.repository);

  Future<void> call() async {
    await repository.logout();
  }
}
