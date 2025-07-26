import 'package:remittance/domain/dto/user/login_response.dart';
import 'package:remittance/domain/dto/user/register_request.dart';
import 'package:remittance/domain/dto/user/transaction.dart';

abstract class UserRepository{
  Future<LoginResponse?> login(String value);
  Future<RegisterUser?> registerUser(RegisterUser user) ;
  Future<List<RegisterUser>?> getUserList();
  Future<RegisterUser?> getUerById(String userId);
  Future<RegisterUser?> updateUser(RegisterUser user);
  Future<TransactionModel?> transactions(TransactionModel transaction);
  Future<List<TransactionModel>?> sendTransaction(String id);
  Future<List<TransactionModel>?> receivedTransaction(String id);
}