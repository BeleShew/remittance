import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:remittance/app/utils/enums.dart';
import 'package:remittance/app/utils/helper_methods.dart';
import 'package:remittance/domain/dto/http/http_attrib_options.dart';
@lazySingleton
class HttpDataSources{
  // final AccessTokenRepository _accessTokenRepository;
  final _dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 60), // 60 seconds60 * 1000
      receiveTimeout: const Duration(seconds: 60) // 60 seconds
  ));
  HttpDataSources(){
    _dio.interceptors.add(InterceptorsWrapper(onRequest: _onRequestInterceptor));
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }
  }
  _onRequestInterceptor(RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }
  Future<String?> send(HttpAttribOptions httpAttribOptions) async {
      var url = Uri.parse(httpAttribOptions.baseUrl + httpAttribOptions.path);
      try {
        if(httpAttribOptions.serializationMethod==BodySerializationMethod.UrlEncoded){
          _dio.options.headers={'Content-Type': 'application/x-www-form-urlencoded'};
        }
        else if(httpAttribOptions.serializationMethod==BodySerializationMethod.FormData){
          _dio.options.headers={ "Content-Type": "multipart/form-data",};
        }
        else{
          _dio.options.headers={'Content-Type': 'application/json; charset=UTF-8'};
        }
        final response =await _dio.request(
            url.toString(),
            data:httpAttribOptions.formData ?? httpAttribOptions.body,
            queryParameters:httpAttribOptions.queryParameters,
            options: Options(
                method:enumToString(httpAttribOptions.method),
                contentType:httpAttribOptions.serializationMethod==BodySerializationMethod.FormData? Headers.multipartFormDataContentType:httpAttribOptions.serializationMethod==BodySerializationMethod.UrlEncoded? Headers.formUrlEncodedContentType:Headers.jsonContentType),
            onSendProgress: httpAttribOptions.onSendProgress);
        if (response.statusCode == 200) {
          String jsonString = jsonEncode(response.data);
          return jsonString;
        }
        else if ((response.statusCode == 401 || response.statusCode == 403)) {
          /*refresh or get access token and re-try the request*/
          // await _accessTokenRepository.updateAccessToken(httpAttribOptions.body);
          _dio.interceptors.add(InterceptorsWrapper(onRequest:_onRequestInterceptor));
          final response =await _dio.request(url.path,
              data: httpAttribOptions.formData ?? httpAttribOptions.body,
              queryParameters:httpAttribOptions.queryParameters,
              options: Options(method:enumToString(httpAttribOptions.method)),
              onSendProgress: httpAttribOptions.onSendProgress);
          String jsonString = jsonEncode(response.data);
          return jsonString;
        }
        else{
          String jsonString = jsonEncode(response.data);
          return jsonString;
        }
      } on DioException catch (e) {
        if ((e.response?.statusCode == 401 || e.response?.statusCode == 403)){
          _dio.interceptors.add(InterceptorsWrapper(onRequest:_onRequestInterceptor));
          final response =await _dio.request(url.path,
              data: httpAttribOptions.formData ?? httpAttribOptions.body,
              queryParameters:httpAttribOptions.queryParameters,
              options: Options(method:enumToString(httpAttribOptions.method)),
              onSendProgress: httpAttribOptions.onSendProgress);
          String jsonString = jsonEncode(response.data);
          return jsonString;
        }
        return jsonEncode({
          'status': e.response?.statusCode,
          'message': e.message,
          'data': e.response?.data,
        });
      }
    }
  }