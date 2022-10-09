import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/exceptions/unauthorized_exception.dart';
import '../../core/rest/custom_dio.dart';
import '../../models/register_user_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final CustomDio _dio;

  const AuthRepositoryImpl({required CustomDio dio}) : _dio = dio;

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _dio.unauth().post(
        '/api/auth',
        data: {
          'email': email,
          'password': password,
        },
      );

      final acessToken = result.data['access_token'];

      if (acessToken == null) {
        throw UnauthorizedException();
      }

      return acessToken;
    } on DioError catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);

      if (e.response?.statusCode == HttpStatus.unauthorized) {
        Error.throwWithStackTrace(UnauthorizedException(), s);
      }

      Error.throwWithStackTrace(
        const RepositoryException('Erro ao realizar login'),
        s,
      );
    }
  }

  @override
  Future<void> logout() async {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> register(RegisterUserModel registerModel) async {
    try {
      await _dio.unauth().post('/api/register', data: registerModel.toMap());
    } on DioError catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);

      Error.throwWithStackTrace(
        const RepositoryException('Erro ao registrar usuário'),
        s,
      );
    }
  }
}
