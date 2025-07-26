class SendMoneyResponse {
  final bool success;
  final String message;
  final String? transactionId;

  SendMoneyResponse({
    required this.success,
    required this.message,
    this.transactionId,
  });

  factory SendMoneyResponse.fromJson(Map<String, dynamic> json) {
    return SendMoneyResponse(
      success: json['success'],
      message: json['message'],
      transactionId: json['transactionId'],
    );
  }
}