import 'package:flutter/material.dart';

@immutable
class TransactionModel {
  final String? transactionId;
  final String? senderId;
  final String? receiverId;
  final double? amount;
  final String? currency;
  final DateTime? timestamp;
   String? status;

   TransactionModel({
     this.transactionId,
     this.senderId,
     this.receiverId,
     this.amount,
     this.currency,
     this.timestamp,
    this.status,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    transactionId: json["transactionId"],
    senderId: json["senderId"],
    receiverId: json["receiverId"],
    amount: (json["amount"] as num).toDouble(),
    currency: json["currency"],
    timestamp: DateTime.parse(json["timestamp"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    'transactionId': transactionId,
    'senderId': senderId,
    'receiverId': receiverId,
    'amount': amount,
    'currency': currency,
    'timestamp': timestamp?.toIso8601String(),
    'status': status,
  };
}