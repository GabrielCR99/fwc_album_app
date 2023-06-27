final class UserModel {
  final String name;
  final String email;
  final int totalAlbum;
  final int totalStickers;
  final int totalDuplicates;
  final int totalComplete;
  final int totalCompletePercent;

  const UserModel({
    required this.name,
    required this.email,
    required this.totalAlbum,
    required this.totalStickers,
    required this.totalDuplicates,
    required this.totalComplete,
    required this.totalCompletePercent,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        name: (map['name'] ?? '') as String,
        email: (map['email'] ?? '') as String,
        totalAlbum: (map['total_album'] ?? 0) as int,
        totalStickers: (map['total_stickers'] ?? 0) as int,
        totalDuplicates: (map['total_duplicates'] ?? 0) as int,
        totalComplete: (map['total_complete'] ?? 0) as int,
        totalCompletePercent: (map['total_complete_percent'] ?? 0) as int,
      );
}
