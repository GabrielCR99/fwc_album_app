final class RegisterStickerModel {
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

  factory RegisterStickerModel.fromMap(Map<String, dynamic> map) =>
      RegisterStickerModel(
        stickerName: (map['sticker_name'] ?? '') as String,
        stickerCode: (map['sticker_code'] ?? '') as String,
        stickerNumber: (map['sticker_number'] ?? '') as String,
        stickerImageUpload: (map['sticker_image_upload'] ?? '') as String,
      );

  Map<String, dynamic> toMap() => {
        'sticker_name': stickerName,
        'sticker_code': stickerCode,
        'sticker_number': stickerNumber,
        'sticker_image_upload': stickerImageUpload,
      };
}
