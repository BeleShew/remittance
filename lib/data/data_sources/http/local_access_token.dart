import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../../app/utils/keys.dart';

@lazySingleton
class LocalAccessTokenDataSources{
  static const _storage = FlutterSecureStorage();
  Future<String?> getAccessToken() async => await _storage.read(key: Keys.accessToken);
  Future deleteAccessToken() async =>await _storage.delete(key: Keys.accessToken);
}