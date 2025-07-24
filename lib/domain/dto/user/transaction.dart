import 'package:flutter/material.dart';

@immutable
class TransactionModel {
  final String transactionId;
  final String fromUserId;
  final String toUserId;
  final double amount;
  final String currency;
  final DateTime timestamp;

  const TransactionModel({
    required this.transactionId,
    required this.fromUserId,
    required this.toUserId,
    required this.amount,
    required this.currency,
    required this.timestamp,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    transactionId: json["transactionId"],
    fromUserId: json["fromUserId"],
    toUserId: json["toUserId"],
    amount: (json["amount"] as num).toDouble(),
    currency: json["currency"],
    timestamp: DateTime.parse(json["timestamp"]),
  );
}