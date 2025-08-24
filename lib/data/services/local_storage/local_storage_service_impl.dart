import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/result/result.dart';
import 'local_storage_service.dart';

final class LocalStorageServiceImpl implements LocalStorageService {
  final FlutterSecureStorage _flutterSecureStorage;

  const LocalStorageServiceImpl({
    required FlutterSecureStorage flutterSecureStorage,
  }) : _flutterSecureStorage = flutterSecureStorage;

  @override
  Future<Result<String>> getIdToken() async {
    final idToken = await _flutterSecureStorage.read(key: 'id_token');
    if (idToken == null) {
      return Failure(Exception('Token not found'));
    }
    return Success(idToken);
  }

  @override
  Future<Result<Unit>> saveIdToken(String idToken) async {
    await _flutterSecureStorage.write(key: 'id_token', value: idToken);
    return successOfUnit();
  }

  @override
  Future<Result<Unit>> removeIdToken() async {
    await _flutterSecureStorage.delete(key: 'id_token');
    return successOfUnit();
  }
}
