import '../../models/register_sticker_model.dart';
import '../../models/sticker_model.dart';
import '../../repositories/stickers/stickers_repository.dart';
import 'find_sticer_service.dart';

class FindSticerServiceImpl implements FindSticerService {
  final StickersRepository _stickersRepository;

  const FindSticerServiceImpl({required StickersRepository stickersRepository})
      : _stickersRepository = stickersRepository;

  @override
  Future<StickerModel> execute(String code, String number) async {
    var sticker = await _stickersRepository.findStickerByCode(code, number);

    if (sticker == null) {
      final registerSticker = RegisterStickerModel(
        stickerName: '',
        stickerCode: code,
        stickerNumber: number,
        stickerImageUpload: '',
      );

      sticker = await _stickersRepository.create(registerSticker);
    }

    return sticker;
  }
}
