import 'package:flutter/material.dart';


class RegisterUser {
  final String? id;
  final String? name;
  final String? email;
  final int? phoneNumber;
  final String? password;
  final String? confirmPassword;
   double? balance;
  final String? currency;
  final String? accountNumber;

   RegisterUser({
     this.id,
     this.name,
     this.email,
     this.phoneNumber,
     this.password,
     this.confirmPassword,
    this.balance,
    this.currency,
    this.accountNumber
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) => RegisterUser(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    confirmPassword: json["confirmPassword"],
    phoneNumber: json["phoneNumber"],
    balance: (json["balance"] as num).toDouble(),
    currency: json["currency"],
    accountNumber: json["accountNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "confirmPassword": confirmPassword,
    "phoneNumber": phoneNumber,
    "balance": balance,
    "currency": currency,
    "accountNumber": accountNumber,
  };
}