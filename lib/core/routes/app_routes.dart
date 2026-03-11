import 'package:get/get.dart';
import '../../domain/entities/product.dart';
import '../../presentation/screens/login_screen.dart';
import '../../presentation/screens/main_screen.dart';
import '../../presentation/screens/post/post_details_screen.dart';
import '../../presentation/screens/product_details_screen.dart';
import '../../presentation/screens/splash_screen.dart';
import '../bindings/login_binding.dart';
import '../bindings/main_binding.dart';

class AppRoutes {
  static const String splash = '/';
  static const String loginScreen = '/login';
  static const mainScreen = '/main';
  static const productDetailsScreen = '/product-details';
  static const postDetailsScreen = '/post-details';

  static final routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: mainScreen,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: productDetailsScreen,
      page: () {
        return ProductDetailsScreen();
      },
    ),
    GetPage(
      name: postDetailsScreen,
      page: () {
        return PostDetailsScreen();
      },
    ),
  ];
}
