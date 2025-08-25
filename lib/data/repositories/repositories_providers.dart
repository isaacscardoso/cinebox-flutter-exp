import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/services_providers.dart';
import 'auth/auth.dart';

part 'repositories_providers.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    localStorageService: ref.read(localStorageServiceProvider),
    googleSignInService: ref.read(googleSignInServiceProvider),
  );
}
