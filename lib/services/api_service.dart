import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:product_list/utils/endpoints.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
    ),
  );

  static void _addCache() {
    _dio.interceptors.add(
      DioCacheManager(
        CacheConfig(),
      ).interceptor,
    );
  }

  static Future<Response> getRequest(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    _addCache();

    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: buildCacheOptions(
        const Duration(days: 7),
        maxStale: const Duration(days: 10),
      ),
    );

    return response;
  }
}
