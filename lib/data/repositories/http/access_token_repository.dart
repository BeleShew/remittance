import 'package:injectable/injectable.dart';
import 'package:remittance/data/data_sources/http/local_access_token.dart';
import 'package:remittance/data/data_sources/http/remote_access_token.dart';
import '../../../domain/repositories/http/access_token_repository.dart';

@LazySingleton(as: AccessTokenRepository)
class AccessTokenRepositoryImpl extends AccessTokenRepository{
  final RemoteAccessTokenDataSources _remoteAccessTokenDataSources;
  final LocalAccessTokenDataSources _localCategoryDataSources;
  AccessTokenRepositoryImpl(this._remoteAccessTokenDataSources,this._localCategoryDataSources);

  @override
  Future deleteAccessToken() {
    return _localCategoryDataSources.deleteAccessToken();
  }

  @override
  Future setAccessToken(String value) {
    return _remoteAccessTokenDataSources.setAccessToken(value);
  }

  @override
  Future<String?> getLocalAccessToken() {
    return _localCategoryDataSources.getAccessToken();
  }

  @override
  Future<String?> getRemoteAccessToken() {
    return _remoteAccessTokenDataSources.getAccessToken();
  }

  @override
  Future updateAccessToken(String email,String password) {
    return _remoteAccessTokenDataSources.updateAccessToken(email,password);
  }
}