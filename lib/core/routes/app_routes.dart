import 'package:get/get.dart';

import '../../presentation/screens/product_screen.dart';
import '../bindings/product_binding.dart';

class AppRoutes {
  static const String productScreen = '/products';

  static final routes = [
    GetPage(
      name: productScreen,
      page: () => const ProductScreen(),
      binding: ProductBinding(),
    ),
  ];
}
