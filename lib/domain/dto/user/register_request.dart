import 'package:flutter/material.dart';

@immutable
class RegisterUser {
  final String? name;
  final String? email;
  final int? phoneNumber;
  final String? password;
  final String? confirmPassword;
  final double? balance;
  final String? currency;

  const RegisterUser({
     this.name,
     this.email,
     this.phoneNumber,
     this.password,
     this.confirmPassword,
    this.balance,
    this.currency
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    confirmPassword: json["confirmPassword"],
    phoneNumber: json["phoneNumber"],
    balance: (json["balance"] as num).toDouble(),
    currency: json["currency"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
    "phoneNumber": phoneNumber,
    "balance": balance,
    "currency": currency,
  };
}