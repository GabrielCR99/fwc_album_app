import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest/custom_dio.dart';
import '../../models/group_stickers.dart';
import 'stickers_repository.dart';

class StickersRepositoryImpl implements StickersRepository {
  final CustomDio _dio;

  const StickersRepositoryImpl({required CustomDio dio}) : _dio = dio;

  @override
  Future<List<GroupStickers>> getMyAlbum() async {
    try {
      final result = await _dio.get('/api/countries');

      final data = result.data as List;

      return data
          .cast<Map<String, dynamic>>()
          .map<GroupStickers>(GroupStickers.fromMap)
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar os stickers', error: e, stackTrace: s);

      Error.throwWithStackTrace(
        const RepositoryException('Erro ao buscar stickers'),
        s,
      );
    }
  }
}
