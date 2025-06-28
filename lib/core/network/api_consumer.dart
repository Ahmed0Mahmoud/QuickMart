import 'package:dio/dio.dart';

abstract class ApiConsumer {
  get(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  });

  post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    // bool isFormData = false,
  });

  patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    // bool isFormData = false,
  });

  delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    // bool isFormData = false,
  });
}
