import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../config/env/env.dart';
import 'interceptors/auth_interceptor.dart';

final class CustomDio extends DioForNative {
  final _authInterceptor = AuthInterceptor();

  CustomDio()
      : super(
          BaseOptions(
            connectTimeout: const Duration(milliseconds: 10000),
            receiveTimeout: const Duration(milliseconds: 60000),
            baseUrl: Env.i['backendBaseUrl'] ?? '',
          ),
        ) {
    interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  CustomDio auth() => this..interceptors.add(_authInterceptor);

  CustomDio unauth() => this..interceptors.remove(_authInterceptor);
}
