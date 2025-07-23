import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:remittance/app/utils/keys.dart';

@lazySingleton
class RemoteAccessTokenDataSources{
  static const _storage = FlutterSecureStorage();
   Future setAccessToken(String value) async => await _storage.write(key: Keys.accessToken, value: value);
   Future<String?> getAccessToken() async => await _storage.read(key: Keys.accessToken);
  Future updateAccessToken(String email,String password) async {
    /* get remote access token and update the local */
    // await _loginRepository.login(LoginRequest("admin", "123456"));
   // await getIt<LoginRepository>().login(LoginRequest("admin", "123456"));
  }
}