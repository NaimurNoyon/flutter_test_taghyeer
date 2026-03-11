import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasource/login_remote_datasource.dart';
import '../datasource/user_local_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final UserLocalDataSource localDataSource;

  LoginRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<User> login({
    required String username,
    required String password,
  }) async {
    final user = await remoteDataSource.login(
      username: username,
      password: password,
    );

    await localDataSource.saveUser(user);

    return user;
  }
}
