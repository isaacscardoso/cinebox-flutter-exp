import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/app/app_messages.dart';
import '../../../core/result/result.dart';
import '../../exceptions/data_exception.dart';
import '../../services/auth/auth_service.dart';
import '../../services/google_signin/google_signin.dart';
import '../../services/local_storage/local_storage.dart';
import 'auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  final LocalStorageService _localStorageService;
  final GoogleSignInService _googleSignInService;
  final AuthService _authService;

  const AuthRepositoryImpl({
    required LocalStorageService localStorageService,
    required GoogleSignInService googleSignInService,
    required AuthService authService,
  }) : _localStorageService = localStorageService,
       _googleSignInService = googleSignInService,
       _authService = authService;

  Result<T> _registerLogAndReturnFailure<T>(
    String message,
    Exception error, [
    StackTrace? stackTrace,
  ]) {
    log(
      message,
      name: 'AuthRepositoryImpl',
      error: error,
      stackTrace: stackTrace,
    );
    return Failure(DataException(message: message));
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSignInService.signIn();

    switch (result) {
      case Success<String>(:final value):
        try {
          await _localStorageService.saveIdToken(value);
          await _authService.auth();
          return successOfUnit();
        } on DioException catch (error, stackTrace) {
          return _registerLogAndReturnFailure(
            AppMessages.backendAuthError,
            error,
            stackTrace,
          );
        }
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
