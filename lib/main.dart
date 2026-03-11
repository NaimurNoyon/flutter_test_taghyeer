import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'core/bindings/initial_binding.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test Taghyeer',
      initialBinding: InitialBinding(),
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.splash,
      getPages: AppRoutes.routes,
    );
  }
}
