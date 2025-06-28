import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:quick_mart/core/network/api_consumer.dart';
import 'package:quick_mart/core/sensetive_data.dart';

import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.interceptors.add(PrettyDioLogger(request: true, requestHeader: true));
    dio.options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      headers: {"apikey": anonKey},
    );
  }

  @override
  Future<dynamic> get(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //final String? userToken = await token(); // Ensure token is awaited
    Response response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      Response response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      // handleDioExceptions(e);
    }
  }

  @override
  delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    Response response = await dio.delete(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }

  @override
  patch(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool isFormData = false,
  }) async {
    Response response = await dio.patch(
      path,
      data: isFormData ? FormData.fromMap(data) : data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
