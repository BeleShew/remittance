import 'package:flutter/material.dart';

class LoginResponse {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
   double? balance;
  final String? currency;
  final int? phoneNumber;
  final String? accountNumber;
   LoginResponse({
     this.id,
     this.name,
     this.email,
     this.password,
     this.balance,
     this.currency,
     this.phoneNumber,
     this.accountNumber,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
    balance:(json["balance"] as num).toDouble(),
    currency: json["currency"],
    phoneNumber: json["phoneNumber"],
    accountNumber: json["accountNumber"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "password": password,
    "balance": balance,
    "currency": currency,
    "phoneNumber": phoneNumber,
    "accountNumber": accountNumber,
  };
}