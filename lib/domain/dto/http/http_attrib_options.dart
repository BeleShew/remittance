import 'package:dio/dio.dart';

import '../../../app/utils/enums.dart';

class HttpAttribOptions {
  String baseUrl;
  String path;
  Object? body;
  BodySerializationMethod? serializationMethod;
  RequestMethods method;
  HttpRequestPriority? priority;
  Map<String, String>? queryParameters;
  int? timeoutDuration;
  FormData? formData;
  ProgressCallback? onSendProgress;
  HttpAttribOptions(
      {required this.baseUrl,
        required this.path,
        required this.method,
        this.queryParameters,
        this.serializationMethod,
        this.body,
        this.formData,
        this.onSendProgress,
        this.priority,
        this.timeoutDuration,
      });
}