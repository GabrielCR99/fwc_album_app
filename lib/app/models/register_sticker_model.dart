import 'dart:convert';

class RegisterStickerModel {
  final String stickerName;
  final String stickerCode;
  final String stickerNumber;
  final String stickerImageUpload;

  const RegisterStickerModel({
    required this.stickerName,
    required this.stickerCode,
    required this.stickerNumber,
    required this.stickerImageUpload,
  });

  Map<String, dynamic> toMap() => {
        'sticker_name': stickerName,
        'sticker_code': stickerCode,
        'sticker_number': stickerNumber,
        'sticker_image_upload': stickerImageUpload,
      };

  factory RegisterStickerModel.fromMap(Map<String, dynamic> map) =>
      RegisterStickerModel(
        stickerName: map['sticker_name'] ?? '',
        stickerCode: map['sticker_code'] ?? '',
        stickerNumber: map['sticker_number'] ?? '',
        stickerImageUpload: map['sticker_image_upload'] ?? '',
      );

  String toJson() => json.encode(toMap());

  factory RegisterStickerModel.fromJson(String source) =>
      RegisterStickerModel.fromMap(json.decode(source));
}
