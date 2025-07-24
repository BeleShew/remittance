import 'package:remittance/domain/dto/user/login_response.dart';
import 'package:remittance/domain/dto/user/register_request.dart';

abstract class UserRepository{
  Future<LoginResponse?> login(String value);
  Future<RegisterUser?> registerUser(RegisterUser user) ;
}