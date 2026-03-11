import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrls {
  static final String baseUrl =
      dotenv.env['BASE_URL'] ?? "https://dummyjson.com";

  static String login() => "$baseUrl/auth/login";
  static String posts({int limit = 10, int skip = 0}) =>
      "$baseUrl/posts?limit=$limit&skip=$skip";
  static String products({int limit = 10, int skip = 0}) =>
      "$baseUrl/products?limit=$limit&skip=$skip";
}
