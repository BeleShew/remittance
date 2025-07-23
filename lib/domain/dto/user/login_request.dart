import 'package:flutter/material.dart';

@immutable
class LoginRequest {
  final String password;
  final String email;

  const LoginRequest({
    required this.password,
    required this.email,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    password: json["password"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "email": email
  };

}