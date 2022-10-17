import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest/custom_dio.dart';
import '../../models/group_stickers.dart';
import '../../models/register_sticker_model.dart';
import '../../models/sticker_model.dart';
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

  @override
  Future<StickerModel?> findStickerByCode(String code, String number) async {
    try {
      final result = await _dio.auth().get(
        '/api/sticker-search',
        queryParameters: {
          'sticker_code': code,
          'sticker_number': number,
        },
      );

      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      const errorMessage = 'Erro ao buscar figurinha';

      log(errorMessage, error: e, stackTrace: s);

      if (e.response?.statusCode == HttpStatus.notFound) {
        return null;
      }

      Error.throwWithStackTrace(const RepositoryException(errorMessage), s);
    }
  }

  @override
  Future<StickerModel> create(RegisterStickerModel registerStickerModel) async {
    try {
      final body = FormData.fromMap({...registerStickerModel.toMap()});

      final result = await _dio.auth().post('/api/sticker', data: body);

      return StickerModel.fromMap(result.data);
    } on DioError catch (e, s) {
      const errorMessage = 'Erro ao criar figurinha';

      log(errorMessage, error: e, stackTrace: s);

      Error.throwWithStackTrace(const RepositoryException(errorMessage), s);
    }
  }

  @override
  Future<void> registerUserSticker(int stickerId, int amount) async {
    try {
      await _dio.auth().post(
        '/api/user/sticker',
        data: {'id_sticker': stickerId, 'amount': amount},
      );
    } on DioError catch (e, s) {
      const errorMessage = 'Erro ao registrar figurinha';

      log(errorMessage, error: e, stackTrace: s);

      Error.throwWithStackTrace(const RepositoryException(errorMessage), s);
    }
  }

  @override
  Future<void> updateUserSticker(int stickerId, int amount) async {
    try {
      await _dio.auth().put(
        '/api/user/sticker',
        data: {'id_sticker': stickerId, 'amount': amount},
      );
    } on DioError catch (e, s) {
      const errorMessage = 'Erro ao registrar figurinha';

      log(errorMessage, error: e, stackTrace: s);

      Error.throwWithStackTrace(const RepositoryException(errorMessage), s);
    }
  }
}