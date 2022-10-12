import 'dart:convert';

class UserStickerModel {
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

  Map<String, dynamic> toMap() => {
        'id': id,
        'idUser': idUser,
        'idSticker': idSticker,
        'duplicate': duplicate,
        'stickerCode': stickerCode,
        'stickerNumber': stickerNumber,
      };

  factory UserStickerModel.fromMap(Map<String, dynamic> map) =>
      UserStickerModel(
        id: map['id']?.toInt() ?? 0,
        idUser: map['id_user']?.toInt() ?? 0,
        idSticker: map['id_sticker']?.toInt() ?? 0,
        duplicate: map['duplicate']?.toInt() ?? 0,
        stickerCode: map['sticker_code'] ?? '',
        stickerNumber: map['sticker_number'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory UserStickerModel.fromJson(String source) =>
      UserStickerModel.fromMap(json.decode(source));
}
