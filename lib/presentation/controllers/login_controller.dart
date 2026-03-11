import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/routes/app_routes.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginController extends GetxController {
  final LoginUser loginUser;

  LoginController(this.loginUser);

  // TextControllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Errors
  String? emailError;
  String? passwordError;

  // Password visibility
  bool isPasswordVisible = false;

  // Loading state
  bool isLoading = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  Future<void> login() async {
    // Validation
    emailError = emailController.text.trim().isEmpty
        ? "Username is required"
        : null;
    passwordError = passwordController.text.trim().isEmpty
        ? "Password is required"
        : null;
    update();

    if (emailError != null || passwordError != null) return;

    try {
      isLoading = true;
      update();

      User user = await loginUser(
        username: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      isLoading = false;
      update();

      Get.snackbar(
        "Success",
        "Welcome ${user.firstName}",
        snackPosition: SnackPosition.TOP,
      );

      // Navigate to Product Screen or Home
      Get.offAllNamed(AppRoutes.mainScreen);
    } catch (e) {
      isLoading = false;
      update();
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
