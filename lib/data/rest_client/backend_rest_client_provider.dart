import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/env.dart';
import 'interceptors/backend_auth_interceptor.dart';

part 'backend_rest_client_provider.g.dart';

@Riverpod(keepAlive: true)
Dio backendRestClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.backendBaseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  dio.options.headers['Content-Type'] = 'application/json';
  dio.interceptors.addAll([
    BackendAuthInterceptor(ref: ref),
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
