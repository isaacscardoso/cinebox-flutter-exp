import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/app/app_messages.dart';
import '../../../core/result/result.dart';
import '../../../data/repositories/repositories_providers.dart';

part 'login_with_google_command.g.dart';

@riverpod
final class LoginWithGoogleCommand extends _$LoginWithGoogleCommand {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> execute() async {
    state = const AsyncLoading();
    final authRepository = ref.read(authRepositoryProvider);

    final result = await authRepository.signIn();

    switch (result) {
      case Success<Unit>():
        state = const AsyncData(null);
      case Failure<Unit>():
        log(
          AppMessages.loginError,
          name: 'LoginWithGoogleCommand',
          error: result.error,
          stackTrace: StackTrace.current,
        );
        state = AsyncError(AppMessages.loginError, StackTrace.current);
    }
  }
}
