import 'package:flutter/material.dart';

@immutable
class RegisterUser {
  final String name;
  final String email;
  final double balance;
  final String currency;

  const RegisterUser({
    required this.name,
    required this.email,
    required this.balance,
    required this.currency,
  });
}