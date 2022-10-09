import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import '../config/env/env.dart';

class CustomDio extends DioForNative {
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: Env.i['backendBaseUrl'] ?? '',
            connectTimeout: 10000,
            receiveTimeout: 60000,
          ),
        ) {
    interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  CustomDio auth() {
    options.headers['Authorization'] = 'Bearer ${Env.i['token']}';

    return this;
  }

  CustomDio unauth() {
    options.headers.remove('Authorization');

    return this;
  }
}
