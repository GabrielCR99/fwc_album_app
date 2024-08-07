import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest/custom_dio.dart';
import '../../models/user_model.dart';
import 'user_repository.dart';

final class UserRepositoryImpl implements UserRepository {
  final CustomDio dio;

  const UserRepositoryImpl({required this.dio});

  @override
  Future<UserModel> getMe() async {
    try {
      final result = await dio.auth().get<Map<String, dynamic>>('/api/me');

      return UserModel.fromMap(result.data!);
    } on DioException catch (e, s) {
      const errorMessage = 'Erro ao buscar usuário logado';

      log(errorMessage, error: e, stackTrace: s);
      Error.throwWithStackTrace(const RepositoryException(errorMessage), s);
    }
  }
}
