import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/domain/dto/exchnage_rate/exchange_rate_model.dart';

class ExchangeRateNotifier extends StateNotifier<ExchangeRateModel> {
  ExchangeRateNotifier()
      : super(ExchangeRateModel(
    sourceCurrency: 'USD',
    targetCurrency: 'EUR',
    sourceAmount: 1.0,
  ));

  final Map<String, double> currencyRates = {
    'USD': 1.0,
    'EUR': 0.93,
    'GBP': 0.79,
    'JPY': 157.47,
    'INR': 83.33,
    'CAD': 1.36,
    'AUD': 1.50,
  };

  double convertAmount(ExchangeRateModel state) {
    final sourceRate = currencyRates[state.sourceCurrency] ?? 1.0;
    final targetRate = currencyRates[state.targetCurrency] ?? 1.0;
    return state.sourceAmount * (targetRate / sourceRate);
  }

  void updateSourceCurrency(String currency) {
    state = state.copyWith(sourceCurrency: currency);
  }

  void updateTargetCurrency(String currency) {
    state = state.copyWith(targetCurrency: currency);
  }

  void updateSourceAmount(String amount) {
    final parsed = double.tryParse(amount) ?? 0.0;
    state = state.copyWith(sourceAmount: parsed);
  }

  void swapCurrencies() {
    state = state.copyWith(
      sourceCurrency: state.targetCurrency,
      targetCurrency: state.sourceCurrency,
    );
  }
}