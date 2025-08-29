import 'package:arz8_task/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  ApiService() {
    dio.options.baseUrl = endpoint;
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      return await dio.get(path, queryParameters: queryParams);
    } catch (e) {
      rethrow;
    }
  }
}
