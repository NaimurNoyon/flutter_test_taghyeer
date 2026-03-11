import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../datasource/user_local_datasource.dart';
import '../models/user_model.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  @override
  Future<UserModel?> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    final userString = prefs.getString("user");

    if (userString == null) return null;

    return UserModel.fromJson(jsonDecode(userString));
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("user", jsonEncode(user.toJson()));
  }

  @override
  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("user");
  }
}
