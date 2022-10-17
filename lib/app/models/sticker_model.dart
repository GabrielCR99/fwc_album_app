class StickerModel {
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
        id: map['id']?.toInt() ?? 0,
        stickerCode: map['sticker_code'] ?? '',
        stickerName: map['sticker_name'] ?? '',
        stickerNumber: map['sticker_number'] ?? '',
        stickerImage: map['sticker_image'] ?? '',
      );
}
