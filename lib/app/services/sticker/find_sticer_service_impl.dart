import '../../models/register_sticker_model.dart';
import '../../models/sticker_model.dart';
import '../../repositories/stickers/stickers_repository.dart';
import 'find_sticker_service.dart';

final class FindSticerServiceImpl implements FindStickerService {
  final StickersRepository stickersRepository;

  const FindSticerServiceImpl({required this.stickersRepository});

  @override
  Future<StickerModel> execute(String code, String number) async {
    var sticker = await stickersRepository.findStickerByCode(code, number);

    if (sticker == null) {
      final registerSticker = RegisterStickerModel(
        stickerName: '',
        stickerCode: code,
        stickerNumber: number,
        stickerImageUpload: '',
      );

      sticker = await stickersRepository.create(registerSticker);
    }

    return sticker;
  }
}
