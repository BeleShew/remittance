import 'package:flutter/material.dart';

@immutable
class ExchangeRateModel {
  final String sourceCurrency;
  final String targetCurrency;
  final double sourceAmount;

  const ExchangeRateModel({
    required this.sourceCurrency,
    required this.targetCurrency,
    required this.sourceAmount,
  });

  ExchangeRateModel copyWith({
    String? sourceCurrency,
    String? targetCurrency,
    double? sourceAmount,
  }) {
    return ExchangeRateModel(
      sourceCurrency: sourceCurrency ?? this.sourceCurrency,
      targetCurrency: targetCurrency ?? this.targetCurrency,
      sourceAmount: sourceAmount ?? this.sourceAmount,
    );
  }
}
