import 'package:injectable/injectable.dart';
import 'package:remittance/app/utils/oprational_result.dart';
import 'package:remittance/data/data_sources/user/user.dart';
import 'package:remittance/domain/dto/user/login_response.dart';
import 'package:remittance/domain/dto/user/register_request.dart';
import 'package:remittance/domain/dto/user/transaction.dart';
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
  @override
  Future<List<RegisterUser>?> getUserList() {
    return _remoteUserDataSources.getUserList();
  }
  @override
  Future<RegisterUser?> updateUser(RegisterUser user) {
    return _remoteUserDataSources.updateUser(user);
  }

  @override
  Future<TransactionModel?> transactions(TransactionModel transaction) {
    return _remoteUserDataSources.transaction(transaction);
  }

  @override
  Future<List<TransactionModel>?> sendTransaction(String id) {
    return _remoteUserDataSources.getSendTransaction(id);
  }
  @override
  Future<List<TransactionModel>?> receivedTransaction(String id) {
    return _remoteUserDataSources.getReceivedTransaction(id);
  }

  @override
  Future<RegisterUser?> getUerById(String userId) {
    return _remoteUserDataSources.getUerById(userId);
  }
}