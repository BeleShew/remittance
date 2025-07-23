import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/utils/enums.dart';
import 'package:remittance/app/utils/helper_methods.dart';
import 'package:remittance/domain/dto/user/login_response.dart';
import 'package:remittance/domain/dto/user/register_request.dart';
import 'package:remittance/domain/repositories/user/user.dart';

class AuthState {
  final AuthStatus status;
  final LoginResponse? user;
  final String? errorMessage;

  AuthState({
    required this.status,
    this.user,
    this.errorMessage,
  });
  AuthState.initial() : this(status: AuthStatus.initial);
}

class AuthNotifier extends StateNotifier<AuthState> {
  final UserRepository _userRepository;

  AuthNotifier(this._userRepository) : super(AuthState.initial());

  Future<void> login(String email,String password) async {
    state = AuthState(status: AuthStatus.loading);
    try {
      final user = await _userRepository.login(email);
      if(user.email!=null &&user.email!.isNotEmpty){
        if(user.password!=null && hasMatch(user.password, password)){
          state = AuthState(status: AuthStatus.authenticated, user: user);
      }else{
          state = AuthState(status: AuthStatus.error, errorMessage: "Incorrect password");
        }
      }
      else{
        state = AuthState(status: AuthStatus.error, errorMessage: "User not found");
      }
    } catch (e) {
      state = AuthState(status: AuthStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> register(RegisterUser user) async {
    state = AuthState(status: AuthStatus.loading);
    try {
      final result = await _userRepository.registerUser(user);
      if (result?.statusCode!= null && result?.statusCode=="200") {
        state = AuthState(status: AuthStatus.authenticated);
      } else {
        state = AuthState(status: AuthStatus.error, errorMessage: result?.statusMessage);
      }
    } catch (e) {
      state = AuthState(status: AuthStatus.error, errorMessage: e.toString());
    }
  }
}
