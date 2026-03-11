import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../api_response.dart';

class NetworkCaller {
  static const String baseUrl = "https://dummyjson.com";

  /// GET REQUEST
  Future<ApiResponse<dynamic>> getRequest(String url) async {
    try {
      final response = await http
          .get(Uri.parse(url), headers: {"Content-Type": "application/json"})
          .timeout(const Duration(seconds: 15));

      return _handleResponse(response);
    } on SocketException {
      return ApiResponse(success: false, message: "No internet connection");
    } on TimeoutException {
      return ApiResponse(success: false, message: "API response is slow");
    } catch (e) {
      return ApiResponse(success: false, message: "Unexpected error: $e");
    }
  }

  /// POST REQUEST
  Future<ApiResponse<dynamic>> postRequest(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: 15));

      return _handleResponse(response);
    } on SocketException {
      return ApiResponse(success: false, message: "No internet connection");
    } on TimeoutException {
      return ApiResponse(success: false, message: "API response is slow");
    } catch (e) {
      return ApiResponse(success: false, message: "Unexpected error: $e");
    }
  }

  ApiResponse<dynamic> _handleResponse(http.Response response) {
    if (response.body.isEmpty) {
      return ApiResponse(success: false, message: "Empty response from server");
    }

    final data = jsonDecode(response.body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ApiResponse(success: true, data: data);
    } else {
      return ApiResponse(
        success: false,
        message: data["message"] ?? "API failure",
      );
    }
  }
}
