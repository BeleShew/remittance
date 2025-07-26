class SendMoneyRequest {
  final String recipientName;
  final String emailOrPhone;
  final String bankName;
  final String accountNumber;
  final double amount;
  final String currency;
  final DateTime timestamp;

  SendMoneyRequest({
    required this.recipientName,
    required this.emailOrPhone,
    required this.bankName,
    required this.accountNumber,
    required this.amount,
    required this.currency,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  factory SendMoneyRequest.fromJson(Map<String, dynamic> json) {
    return SendMoneyRequest(
      recipientName: json['recipientName'],
      emailOrPhone: json['emailOrPhone'],
      bankName: json['bankName'],
      accountNumber: json['accountNumber'],
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'recipientName': recipientName,
      'emailOrPhone': emailOrPhone,
      'bankName': bankName,
      'accountNumber': accountNumber,
      'amount': amount,
      'currency': currency,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
