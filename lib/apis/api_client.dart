import 'dart:io';

import 'package:dio/dio.dart';
import 'package:rsj_f/rsj_f.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ApiClient {
  ApiClient({
    @required this.baseUrl,
    this.responseType,
  }) : assert(baseUrl != null) {
    dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options) {
            dio.interceptors.requestLock.lock();
            if (responseType != null) options.responseType = responseType;
            options.headers = <String, dynamic>{
              'Accept': 'application/json',
              'content-type': 'application/json',
            };
            dio.interceptors.requestLock.unlock();
            return options;
          },
          onError: (DioError error) {
            if (error.error is SocketException) {
              throw UserException(
                'error',
                code: RequestExceptionCode(key: 'no_connection'),
              );
            }
          },
        ),
      );

    if (!kReleaseMode) {
      dio.interceptors.add(LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
      ));
    }
  }

  final String baseUrl;
  final ResponseType responseType;
  Dio dio;
}
