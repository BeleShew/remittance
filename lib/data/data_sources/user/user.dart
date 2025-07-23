import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:remittance/app/utils/oprational_result.dart';
import 'package:remittance/domain/dto/user/login_response.dart';
import 'package:remittance/domain/dto/user/register_request.dart';
import 'package:remittance/domain/dto/user/user_http_attribute.dart';
import 'package:remittance/domain/repositories/http/http_repository.dart';

@lazySingleton
class UserDataSources{
  final HttpRepository _httpService;
  UserDataSources(this._httpService);
  Future<LoginResponse> login(String email) async {
    try {
      final result = await _httpService.send(
            LoginHttpAttribute(
              email:email,
            ),
          );
      if (result != null) {
        final List<dynamic> decodedList = json.decode(result);
        final users = decodedList.map((e) => LoginResponse.fromJson(e)).toList();
            return users.first;
          }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return LoginResponse();
  }
  Future<OperationalResult> register(RegisterUser user) async {
    try {
      final result = await _httpService.send(
            RegisterHttpAttribute(
              request:user,
            ),
          );
      if (result != null) {
            return OperationalResult.fromJson(json.decode(result));
          }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return OperationalResult();
  }
}