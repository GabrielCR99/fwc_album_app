import '../../models/sticker_model.dart';

abstract interface class FindStickerService {
  Future<StickerModel> execute(String code, String number);
}
