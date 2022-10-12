import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/global/global_context.dart';

class AuthInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final sp = await SharedPreferences.getInstance();
    final acessToken = sp.getString('access_token');
    options.headers['Authorization'] = 'Bearer $acessToken';

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      Injector.get<GlobalContext>().loginExpire();
    } else {
      return handler.next(err);
    }
  }
}
