import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:remittance/domain/dto/user/login_response.dart';
import 'package:remittance/domain/dto/user/register_request.dart';
import 'package:remittance/domain/dto/user/transaction.dart';
import 'package:remittance/domain/dto/user/user_http_attribute.dart';
import 'package:remittance/domain/repositories/http/http_repository.dart';

@lazySingleton
class UserDataSources{
  final HttpRepository _httpService;
  UserDataSources(this._httpService);
  Future<LoginResponse?> login(String email) async {
    try {
      final result = await _httpService.send(
            LoginHttpAttribute(
              email:email,
            ),
          );
      if (result != null) {
        final List<dynamic> decodedList = json.decode(result);
        final users = decodedList.map((e) => LoginResponse.fromJson(e)).toList();
        if(users.isEmpty) {
          return null;
        }
        return users.first;
          }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return LoginResponse();
  }
  Future<RegisterUser> register(RegisterUser user) async {
    try {
      final result = await _httpService.send(
            RegisterHttpAttribute(
              request:user,
            ),
          );
      if (result != null) {
            return RegisterUser.fromJson(json.decode(result));
          }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return RegisterUser();
  }

  Future<List<RegisterUser>?> getUserList() async {
    try {
      final result = await _httpService.send(GetUserListHttpAttribute());
      if (result != null) {
        final decoded = json.decode(result);
        final users = (decoded as List).map((json) => RegisterUser.fromJson(json)).toList();
        return users;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user list: $e');
      }
    }
    return null;
  }

  Future<RegisterUser?> updateUser(RegisterUser user,) async {
    try {
      final result = await _httpService.send(
        UpdateHttpAttribute(
          body: user,id:user.id??""
        ),
      );
      if (result != null) {
        return RegisterUser.fromJson(json.decode(result));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user list: $e');
      }
    }
    return null;
  }

  Future<TransactionModel?> transaction(TransactionModel transaction,) async {
    try {
      final result = await _httpService.send(
        TransactionHttpAttribute(
          body: transaction
        ),
      );
      if (result != null) {
        return TransactionModel.fromJson(json.decode(result));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user list: $e');
      }
    }
    return null;
  }

  Future<List<TransactionModel>?> getSendTransaction(String senderId) async {
    try {
      final result = await _httpService.send(SendTransactionHttpAttribute(id: senderId));
      if (result != null) {
        final decoded = json.decode(result);
        final users = (decoded as List).map((json) => TransactionModel.fromJson(json)).toList();
        return users;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user list: $e');
      }
    }
    return null;
  }

  Future<List<TransactionModel>?> getReceivedTransaction(String receivedId) async {
    try {
      final result = await _httpService.send(ReceivedTransactionHttpAttribute(id: receivedId));
      if (result != null) {
        final decoded = json.decode(result);
        final users = (decoded as List).map((json) => TransactionModel.fromJson(json)).toList();
        return users;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user list: $e');
      }
    }
    return null;
  }

  Future<RegisterUser?> getUerById(String userId) async {
    try {
      final result = await _httpService.send(GetUerByIdHttpAttribute(userId: userId));
      if (result != null) {
        return RegisterUser.fromJson(json.decode(result));
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching user list: $e');
      }
    }
    return null;
  }
}