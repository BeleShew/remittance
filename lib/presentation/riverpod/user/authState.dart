import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/utils/enums.dart';
import 'package:remittance/app/utils/helper_methods.dart';
import 'package:remittance/domain/dto/user/login_response.dart';
import 'package:remittance/domain/dto/user/register_request.dart';
import 'package:remittance/domain/dto/user/transaction.dart';
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
      if(user?.email!=null &&user!.email!.isNotEmpty){
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
      final checkAlreadyExist = await _userRepository.login(user.email??"");
      if(checkAlreadyExist?.email!=null &&checkAlreadyExist!.email!.isNotEmpty){
        state = AuthState(status: AuthStatus.error, errorMessage: "User already exist");
      }else{
        final result = await _userRepository.registerUser(user);
        if (result?.email!= null && result!.email!.isNotEmpty) {
          state = AuthState(status: AuthStatus.authenticated);
        }
        else {
          state = AuthState(status: AuthStatus.error, errorMessage: "Unable to create the new user");
        }
      }
    } catch (e) {
      state = AuthState(status: AuthStatus.error, errorMessage: e.toString());
    }
  }

  Future<RegisterUser> getUser(String? user) async {
    try {
      final checkUser = await _userRepository.getUserList();
      if(checkUser?.isNotEmpty!=null){
       return checkUser!.where((tst)=>tst.email==user).first;
      }
      else{
        return RegisterUser();
      }
    } catch (e) {
      EasyLoading.dismiss();
      debugPrint(e.toString());
      return RegisterUser();
    }
  }

    Future<RegisterUser?> getUserById(String? userId) async {
      try {
        final checkUser = await _userRepository.getUerById(userId??"");
        if(checkUser?.id!=null && checkUser?.email!=null){
          return checkUser;
        }
        else{
          return RegisterUser();
        }
      } catch (e) {
        EasyLoading.dismiss();
        debugPrint(e.toString());
        return RegisterUser();
      }
    }

  Future<RegisterUser?> updateUser(String email, double newBalance) async {
    try {
      final users = await _userRepository.getUserList();
      if (users == null || users.isEmpty) return null;
      final user = users.firstWhere(
            (u) => u.email == email,
        orElse: () => RegisterUser(),
      );
      if (user.email == null) return null;
      user.balance = newBalance;
      return await _userRepository.updateUser(user);
    } catch (e) {
      debugPrint('Error updating user: $e');
      return null;
    }
  }

  Future<void> transactions(TransactionModel transaction) async {
    try {
      final tran = await _userRepository.transactions(transaction);
      if(tran!=null && tran.transactionId!=null){
        debugPrint("Transaction is Successful");
      }
      else{
        debugPrint("Transaction is Failed");
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("Transaction is Failed");
    }
  }

  Future<void> refreshLoggedInUser(String email) async {
    final updatedUser = await _userRepository.login(email);
    if (updatedUser != null && updatedUser.email!=null) {
      state = AuthState(status: AuthStatus.authenticated, user: updatedUser);
    }
  }

  Future<List<TransactionModel>?> sendTransactions(String sendId) async {
    try {
      final tran = await _userRepository.sendTransaction(sendId);
      if(tran!=null && tran.isNotEmpty){
        return tran;
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("Transaction is Failed");
    }
    return null;
  }

  Future<List<TransactionModel>?> receivedTransactions(String receivedId) async {
    try {
      final tran = await _userRepository.receivedTransaction(receivedId);
      if(tran!=null && tran.isNotEmpty){
        return tran;
      }
    } catch (e) {
      debugPrint(e.toString());
      debugPrint("Transaction is Failed");
    }
    return null;
  }
}
