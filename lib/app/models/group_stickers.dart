import 'user_sticker_model.dart';

class GroupStickers {
  final int id;
  final String countryCode;
  final String countryName;
  final int stickerStart;
  final int stickersEnd;
  final List<UserStickerModel> stickers;
  final String flag;

  const GroupStickers({
    required this.id,
    required this.countryCode,
    required this.countryName,
    required this.stickerStart,
    required this.stickersEnd,
    required this.stickers,
    required this.flag,
  });

  factory GroupStickers.fromMap(Map<String, dynamic> map) {
    final stickers = map['stickers'] as List<dynamic>;

    return GroupStickers(
      id: map['id']?.toInt() ?? 0,
      countryCode: map['country_code'] ?? '',
      countryName: map['country_name'] ?? '',
      stickerStart: map['stickers_start']?.toInt() ?? 0,
      stickersEnd: map['stickers_end']?.toInt() ?? 0,
      stickers: stickers
          .cast<Map<String, dynamic>>()
          .map<UserStickerModel>(UserStickerModel.fromMap)
          .toList(),
      flag: map['flag'] ?? '',
    );
  }
}
