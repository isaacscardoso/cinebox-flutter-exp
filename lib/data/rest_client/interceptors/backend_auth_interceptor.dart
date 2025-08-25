import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/result/result.dart';
import '../../services/services_providers.dart';

final class BackendAuthInterceptor extends Interceptor {
  final Ref ref;

  const BackendAuthInterceptor({required this.ref});

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final localStorage = ref.read(localStorageServiceProvider);
    final idTokenResult = await localStorage.getIdToken();

    if (idTokenResult case Success(value: final idToken)) {
      options.headers['Authorization'] = 'Bearer $idToken';
    }

    handler.next(options);
  }
}
