final class StickerModel {
  final int id;
  final String stickerCode;
  final String stickerName;
  final String stickerNumber;
  final String stickerImage;

  const StickerModel({
    required this.id,
    required this.stickerCode,
    required this.stickerName,
    required this.stickerNumber,
    required this.stickerImage,
  });

  factory StickerModel.fromMap(Map<String, dynamic> map) => StickerModel(
        id: (map['id'] ?? 0) as int,
        stickerCode: (map['sticker_code'] ?? '') as String,
        stickerName: (map['sticker_name'] ?? '') as String,
        stickerNumber: (map['sticker_number'] ?? '') as String,
        stickerImage: (map['sticker_image'] ?? '') as String,
      );
}
