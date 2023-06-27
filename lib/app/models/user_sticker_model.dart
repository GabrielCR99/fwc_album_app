final class UserStickerModel {
  final int id;
  final int idUser;
  final int idSticker;
  final int duplicate;
  final String stickerCode;
  final String stickerNumber;

  const UserStickerModel({
    required this.id,
    required this.idUser,
    required this.idSticker,
    required this.duplicate,
    required this.stickerCode,
    required this.stickerNumber,
  });

  factory UserStickerModel.fromMap(Map<String, dynamic> map) =>
      UserStickerModel(
        id: (map['id'] ?? 0) as int,
        idUser: (map['id_user'] ?? 0) as int,
        idSticker: (map['id_sticker'] ?? 0) as int,
        duplicate: (map['duplicate_stickers'] ?? 0) as int,
        stickerCode: (map['sticker_code'] ?? '') as String,
        stickerNumber: (map['sticker_number'] ?? '') as String,
      );
}
