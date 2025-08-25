import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/app/app_messages.dart';
import '../../../core/result/result.dart';
import 'google_sign_in_service.dart';

final class GoogleSignInServiceImpl implements GoogleSignInService {
  Result<T> _registerLogAndReturnFailure<T>(
    String message,
    Exception error,
    StackTrace stackTrace,
  ) {
    log(
      message,
      name: 'GoogleSignInService',
      error: error,
      stackTrace: stackTrace,
    );

    return Failure(Exception(message));
  }

  @override
  Future<Result<String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(
        scopeHint: <String>['email', 'profile', 'openId'],
      );

      if (auth.authentication case GoogleSignInAuthentication(
        idToken: final idToken?,
      )) {
        return Success(idToken);
      }

      return Failure(Exception(AppMessages.googleSignInTokenRetriveFailed));
    } on Exception catch (error, stackTrace) {
      return _registerLogAndReturnFailure(
        AppMessages.googleSignInTokenRetriveFailed,
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<Result<String>> isSignedIn() async {
    try {
      final logged = await GoogleSignIn.instance
          .attemptLightweightAuthentication();

      if (logged case GoogleSignInAccount(
        authentication: GoogleSignInAuthentication(idToken: final idToken?),
      )) {
        return Success(idToken);
      }

      return Failure(Exception(AppMessages.googleUserIsNotSignedIn));
    } on Exception catch (error, stackTrace) {
      return _registerLogAndReturnFailure(
        AppMessages.googleUserIsNotSignedIn,
        error,
        stackTrace,
      );
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      return successOfUnit();
    } on Exception catch (error, stackTrace) {
      return _registerLogAndReturnFailure(
        AppMessages.googleUserSignOutError,
        error,
        stackTrace,
      );
    }
  }
}
