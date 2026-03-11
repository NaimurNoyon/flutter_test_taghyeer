import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/bindings/initial_binding.dart';
import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';
import 'core/theme/theme_controller.dart';
import 'presentation/screens/product_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
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
      home: ProductScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ThemeController themeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            border: Border.all(color: theme.colorScheme.secondary),
          ),
          child: Text(
            "Hello, Flutter!",
            style: TextStyle(color: theme.colorScheme.onSurface, fontSize: 20),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          themeController.toggleTheme();
        },
        child: Icon(Icons.brightness_6),
      ),
    );
  }
}
