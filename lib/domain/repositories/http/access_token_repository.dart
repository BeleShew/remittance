abstract class AccessTokenRepository{
  Future setAccessToken(String value);
  Future<String?> getRemoteAccessToken() ;
  Future<String?> getLocalAccessToken() ;
  Future deleteAccessToken();
  Future updateAccessToken(String email,String password);
}