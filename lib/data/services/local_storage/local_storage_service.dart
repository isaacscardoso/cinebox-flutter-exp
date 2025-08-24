import '../../../core/result/result.dart';

abstract interface class LocalStorageService {
  Future<Result<String>> getIdToken();

  Future<Result<Unit>> saveIdToken(String idToken);

  Future<Result<Unit>> removeIdToken();
}
