import '../../../core/result/result.dart';

abstract interface class GoogleSignInService {
  Future<Result<String>> signIn();

  Future<Result<String>> isSignedIn();

  Future<Result<Unit>> signOut();
}
