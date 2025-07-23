import 'package:flutter/material.dart';

@immutable
class LoginResponse {
  final String? name;
  final String? email;
  final String? password;

  const LoginResponse({
     this.name,
     this.email,
     this.password,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    name: json["name"],
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
  };
}

@immutable
class Transaction {
  final String? id;
  final double? amount;
  final String? recipient;
  final DateTime? date;

  const Transaction({
     this.id,
     this.amount,
     this.recipient,
     this.date,
  });
}