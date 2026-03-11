import 'package:flutter/material.dart';
import 'package:flutter_test_taghyeer/presentation/controllers/user_controller.dart';
import 'package:get/get.dart';

import '../../core/theme/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // User Info Section
            GetBuilder<UserDataController>(
              builder: (controller) {
                if (controller.user == null) {
                  return const Text("No user found");
                }
                final user = controller.user!;
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
            ElevatedButton(
              onPressed: () {
                // Implement logout logic
                //Get.offAllNamed(AppRoutes.loginScreen);
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
