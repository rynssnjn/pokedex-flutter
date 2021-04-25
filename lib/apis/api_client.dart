import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokedex_flutter/utilities/app_router.dart';
import 'package:pokedex_flutter/utilities/string_constants.dart';
import 'package:rsj_f/rsj_f.dart';
import 'package:flutter/foundation.dart';

class ApiClient {
  ApiClient({
    required this.baseUrl,
    this.responseType,
  }) {
    dio = Dio()
      ..options.baseUrl = baseUrl
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
            dio.interceptors.requestLock.lock();
            if (responseType != null) options.responseType = responseType!;
            options.headers = <String, dynamic>{
              'Accept': 'application/json',
              'content-type': 'application/json',
            };
            dio.interceptors.requestLock.unlock();
            return handler.next(options);
            // return options;
          },
          onError: (DioError error, ErrorInterceptorHandler _) {
            if (error.error is SocketException) {
              throw UserException(
                generalError.localized(mainNavigatorKey.currentContext!),
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
  final ResponseType? responseType;
  late Dio dio;
}
