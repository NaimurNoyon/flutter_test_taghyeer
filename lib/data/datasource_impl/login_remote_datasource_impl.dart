import '../../constants/app_urls.dart';
import '../../core/services/network_caller.dart';
import '../datasource/login_remote_datasource.dart';
import '../models/user_model.dart';

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final NetworkCaller networkCaller;

  LoginRemoteDataSourceImpl(this.networkCaller);

  @override
  Future<UserModel> login({
    required String username,
    required String password,
  }) async {
    final response = await networkCaller.postRequest(AppUrls.login(), {
      "username": username,
      "password": password,
      "expiresInMins": 30,
    });

    if (response.success) {
      final data = response.data;
      return UserModel.fromJson(data);
    } else {
      throw Exception(response.message);
    }
  }
}
