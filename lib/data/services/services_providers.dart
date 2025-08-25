import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../rest_client/backend_rest_client_provider.dart';
import 'auth/auth_service.dart';
import 'google_signin/google_signin.dart';
import 'local_storage/local_storage.dart';

part 'services_providers.g.dart';

@riverpod
GoogleSignInService googleSignInService(Ref ref) {
  return GoogleSignInServiceImpl();
}

@Riverpod(keepAlive: true)
LocalStorageService localStorageService(Ref ref) {
  return const LocalStorageServiceImpl(
    flutterSecureStorage: FlutterSecureStorage(),
  );
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService(ref.read(backendRestClientProvider));
}
