import 'user_sticker_model.dart';

final class GroupStickers {
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
    final stickers = map['stickers'] as List<Object?>;

    return GroupStickers(
      id: (map['id'] ?? 0) as int,
      countryCode: (map['country_code'] ?? '') as String,
      countryName: (map['country_name'] ?? '') as String,
      stickerStart: (map['stickers_start'] ?? 0) as int,
      stickersEnd: (map['stickers_end'] ?? 0) as int,
      stickers: stickers
          .cast<Map<String, dynamic>>()
          .map<UserStickerModel>(UserStickerModel.fromMap)
          .toList(),
      flag: (map['flag'] ?? '') as String,
    );
  }
}
