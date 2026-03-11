import '../../domain/repositories/user_data_repository.dart';
import '../datasource/user_local_datasource.dart';
import '../models/user_model.dart';

class UserDataRepositoryImpl implements UserDataRepository {
  final UserLocalDataSource localDataSource;

  UserDataRepositoryImpl(this.localDataSource);

  @override
  Future<UserModel?> getUser() {
    return localDataSource.getUser();
  }

  @override
  Future<void> saveUser(UserModel user) {
    return localDataSource.saveUser(user);
  }

  @override
  Future<void> logout() {
    return localDataSource.clearUser();
  }
}
