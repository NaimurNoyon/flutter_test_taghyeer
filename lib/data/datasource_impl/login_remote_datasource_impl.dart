import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

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
    final response = await networkCaller.postRequest(
      "https://dummyjson.com/auth/login",
      {"username": username, "password": password, "expiresInMins": 30},
    );

    if (response.success) {
      final data = response.data;

      // // Save user info in shared preferences
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setString(
      //   'user',
      //   jsonEncode({
      //     "id": data["id"],
      //     "username": data["username"],
      //     "email": data["email"],
      //     "firstName": data["firstName"],
      //     "lastName": data["lastName"],
      //     "gender": data["gender"],
      //     "image": data["image"],
      //   }),
      // );

      return UserModel.fromJson(data);
    } else {
      throw Exception(response.message);
    }
  }
}
