import 'package:flutter_test_taghyeer/domain/repositories/user_data_repository.dart';

import '../../data/models/user_model.dart';

class GetUserUseCase {
  final UserDataRepository repository;

  GetUserUseCase(this.repository);

  Future<UserModel?> call() {
    return repository.getUser();
  }
}
