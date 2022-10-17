import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest/custom_dio.dart';
import '../../models/user_model.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final CustomDio _dio;

  const UserRepositoryImpl({required CustomDio dio}) : _dio = dio;

  @override
  Future<UserModel> getMe() async {
    try {
      final result = await _dio.auth().get('/api/me');

      return UserModel.fromMap(result.data);
    } on DioError catch (e, s) {
      const errorMessage = 'Erro ao buscar usuário logado';

      log(errorMessage, error: e, stackTrace: s);
      Error.throwWithStackTrace(const RepositoryException(errorMessage), s);
    }
  }
}
