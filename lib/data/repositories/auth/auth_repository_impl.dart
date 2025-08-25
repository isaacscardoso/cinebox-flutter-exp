import 'dart:developer';

import '../../../core/app/app_messages.dart';
import '../../../core/result/result.dart';
import '../../exceptions/data_exception.dart';
import '../../services/google_signin/google_signin.dart';
import '../../services/local_storage/local_storage.dart';
import 'auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSignInService _googleSignInService;

  const AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSignInService googleSignInService,
  }) : _localStorageService = localStorageService,
       _googleSignInService = googleSignInService;

  Result<T> _registerLogAndReturnFailure<T>(
    String message,
    Exception error,
  ) {
    log(message, name: 'AuthRepositoryImpl', error: error);
    return Failure(DataException(message: message));
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSignInService.signIn();

    switch (result) {
      case Success<String>(:final value):
        await _localStorageService.saveIdToken(value);
        // TODO: Back-end Login
        return successOfUnit();
      case Failure<String>(:final error):
        return _registerLogAndReturnFailure(AppMessages.loginError, error);
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSignInService.signOut();

    switch (result) {
      case Success<Unit>():
        final removeResult = await _localStorageService.removeIdToken();
        switch (removeResult) {
          case Success<Unit>():
            return successOfUnit();
          case Failure<Unit>(:final error):
            return _registerLogAndReturnFailure(AppMessages.logoutError, error);
        }
      case Failure<Unit>(:final error):
        return _registerLogAndReturnFailure(AppMessages.logoutError, error);
    }
  }

  @override
  Future<Result<bool>> isSignedIn() async {
    final resultToken = await _localStorageService.getIdToken();

    return switch (resultToken) {
      Success<String>() => Success(true),
      Failure<String>() => Success(false),
    };
  }
}
