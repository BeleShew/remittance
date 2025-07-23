import 'dart:convert';

OperationalResult operationalResultFromJson(String str) => OperationalResult.fromJson(json.decode(str));

String operationalResultToJson(OperationalResult data) => json.encode(data.toJson());

class OperationalResult {
  String? error;
  String? errorDescription;
  String? statusCode;
  String? statusMessage;

  OperationalResult({
    this.error,
    this.errorDescription,
    this.statusMessage,
    this.statusCode,
  });

  factory OperationalResult.fromJson(Map<String, dynamic> json) => OperationalResult(
    error: json["error"],
    statusCode: json["statusCode"],
    statusMessage: json["statusMessage"],
    errorDescription: json["error_description"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "error_description": errorDescription,
    "statusMessage": statusMessage,
    "statusCode": statusCode,
  };
}
