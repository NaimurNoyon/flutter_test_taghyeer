import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/theme/theme_controller.dart';
import '../controllers/logout_controller.dart';
import '../controllers/user_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // User Info Section
            GetBuilder<UserDataController>(
              builder: (userController) {
                if (userController.user == null) {
                  return const Text("No user found");
                }
                final user = userController.user!;
                return Column(
                  children: [
                    Image.network(user.image, height: 80, width: 80),
                    Text(user.username),
                    Text(user.firstName),
                    Text(user.email),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),

            // Theme Switching
            GetBuilder<ThemeController>(
              builder: (themeController) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Dark Mode"),
                    Switch(
                      value: themeController.isDarkMode,
                      onChanged: (val) => themeController.toggleTheme(),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),

            // Logout
            GetBuilder<LogoutController>(
              builder: (logoutController) {
                return ElevatedButton(
                  onPressed: () {
                    logoutController.logout();
                  },
                  child: const Text("Logout"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
