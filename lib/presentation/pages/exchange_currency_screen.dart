import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remittance/app/thems/colors.dart';
import 'package:remittance/presentation/riverpod/exchange/exchange_rate_state.dart';
import 'package:remittance/presentation/widgets/app_bar.dart';

@RoutePage()
class ExchangeRateScreen extends ConsumerWidget {
  const ExchangeRateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(exchangeRateProvider);
    final notifier = ref.read(exchangeRateProvider.notifier);
    final convertedAmount = notifier.convertAmount(state);

    return Scaffold(
      appBar: AppBarWidget(
        showLeadingWidget: true,
        title: Text("Currency Converter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Source Currency Input
            _buildCurrencyCard(
              context,
              ref: ref,
              title: "From",
              selectedCurrency: state.sourceCurrency,
              amount: state.sourceAmount.toStringAsFixed(2),
              onCurrencyChanged: notifier.updateSourceCurrency,
              onAmountChanged: notifier.updateSourceAmount,
            ),

            // Swap Button
            IconButton(
              icon: const Icon(Icons.swap_vert, size: 36),
              onPressed: notifier.swapCurrencies,
            ),

            // Target Currency Display
            _buildCurrencyCard(
              context,
              ref: ref,
              title: "To",
              selectedCurrency: state.targetCurrency,
              amount: convertedAmount.toStringAsFixed(2),
              isReadOnly: true,
              onCurrencyChanged: notifier.updateTargetCurrency,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyCard(context,{
    required WidgetRef ref,
    required String title,
    required String selectedCurrency,
    required String amount,
    bool isReadOnly = false,
    required Function(String) onCurrencyChanged,
    Function(String)? onAmountChanged,
  }) {
    final currencies = ref.read(exchangeRateProvider.notifier).currencyRates.keys.toList();
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Row(
              children: [
                // Currency Dropdown
                _buildCurrencyDropdown(
                  context,
                  currencies: currencies,
                  value: selectedCurrency,
                  onChanged: onCurrencyChanged,
                ),
                const SizedBox(width: 16),
                // Amount Field
                Expanded(
                  child: TextField(
                    readOnly: isReadOnly,
                    controller: TextEditingController(text: amount),
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                    style: const TextStyle(fontSize: 18),
                    onChanged: onAmountChanged,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrencyDropdown(context,{
    required List<String> currencies,
    required String value,
    required Function(String) onChanged,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor: AppColors.lightBlack
      ),
      child: DropdownButton<String>(
        value: value,
        items: currencies.map((String currency) {
          return DropdownMenuItem(
            value: currency,
            child: Text(currency, style: const TextStyle(fontSize: 18)),
          );
        }).toList(),
        onChanged: (newValue) => onChanged(newValue!),
      ),
    );
  }
}