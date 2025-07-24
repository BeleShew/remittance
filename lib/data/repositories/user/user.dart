import 'package:injectable/injectable.dart';
import 'package:remittance/app/utils/oprational_result.dart';
import 'package:remittance/data/data_sources/user/user.dart';
import 'package:remittance/domain/dto/user/login_response.dart';
import 'package:remittance/domain/dto/user/register_request.dart';
import 'package:remittance/domain/repositories/user/user.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository{
  final UserDataSources _remoteUserDataSources;
  UserRepositoryImpl(this._remoteUserDataSources);

  @override
  Future<LoginResponse?> login(String email) {
   return _remoteUserDataSources.login(email);
  }

  @override
  Future<RegisterUser?> registerUser(RegisterUser user) {
    return _remoteUserDataSources.register(user);
  }
}