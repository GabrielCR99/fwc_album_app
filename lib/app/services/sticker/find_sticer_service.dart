import '../../models/sticker_model.dart';

abstract class FindSticerService {
  Future<StickerModel> execute(String code, String number);
}
