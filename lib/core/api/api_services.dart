import 'package:dio/dio.dart';

class ApiManager {
  final Dio _dio;

  ApiManager({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> getRequest({
    required String baseUrl,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    var response = await _dio.get(
      "$baseUrl$endPoint",
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
        validateStatus: (status) {
          if (status! < 500) {
            return true;
          }
          return false;
        },
      ),
    );
    return response.data;
  }

  Future<Response> postRequest({
    required String baseUrl,
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? contentType,
  }) async {
    var response = await _dio.post(
      "$baseUrl$endPoint",
      data: body,
      options: Options(
        contentType: contentType,
        validateStatus: (status) {
          if (status! < 500) {
            return true;
          }
          return false;
        },
        headers: headers,
      ),
    );
    return response;
  }

  Future<Response> updateRequest({
    required String baseUrl,
    required String endpoint,
    required Map<String, dynamic> body,
    required Map<String, dynamic> headers,
  }) async {
    var response = await _dio.put(
      "$baseUrl$endpoint",
      data: body,
      options: Options(
        headers: headers,
        validateStatus: (status) {
          if (status! < 500) {
            return true;
          }
          return false;
        },
      ),
    );
    return response;
  }

  Future<Response> deleteRequest({
    required String baseUrl,
    required String endPoint,
    required Map<String, dynamic> headers,
  }) async {
    var response = await _dio.delete(
      "$baseUrl$endPoint",
      options: Options(
        headers: headers,
        validateStatus: (status) {
          if(status! < 500){
            return true;
          }
          return false;
        },
      ),
    );
    return response;
  }
}
