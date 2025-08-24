import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/env.dart';

part 'tmdb_rest_client_provider.g.dart';

@Riverpod(keepAlive: true)
Dio tmdbRestClientProvider(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.tmdbBaseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Authorization'] = 'Bearer ${Env.theMovieDbApiKey}';

  dio.interceptors.addAll([
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ),
  ]);

  return dio;
}
