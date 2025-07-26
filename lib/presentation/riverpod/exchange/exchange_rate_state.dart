import 'package:flutter_riverpod/flutter_riverpod.dart' show StateNotifierProvider;
import 'package:remittance/domain/dto/exchnage_rate/exchange_rate_model.dart';
import 'package:remittance/presentation/riverpod/exchange/exchange_rate_provider.dart';

final exchangeRateProvider = StateNotifierProvider<ExchangeRateNotifier, ExchangeRateModel>(
      (ref) => ExchangeRateNotifier(),
);