import 'package:flutter/material.dart';

@immutable
class LoginResponse {
  final String? name;
  final String? email;
  final String? password;
  final double? balance;
  final String? currency;
  final int? phoneNumber;
  const LoginResponse({
     this.name,
     this.email,
     this.password,
     this.balance,
     this.currency,
     this.phoneNumber,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    balance:(json["balance"] as num).toDouble(),
    currency: json["currency"],
    phoneNumber: json["phoneNumber"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "balance": balance,
    "currency": currency,
    "phoneNumber": phoneNumber,
  };
}