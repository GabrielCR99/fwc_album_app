import 'dart:convert';

class UserModel {
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

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'total_album': totalAlbum,
        'total_stickers': totalStickers,
        'total_duplicates': totalDuplicates,
        'total_complete': totalComplete,
        'total_complete_percent': totalCompletePercent,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        name: map['name'] ?? '',
        email: map['email'] ?? '',
        totalAlbum: map['total_album']?.toInt() ?? 0,
        totalStickers: map['total_stickers']?.toInt() ?? 0,
        totalDuplicates: map['total_duplicates']?.toInt() ?? 0,
        totalComplete: map['total_complete']?.toInt() ?? 0,
        totalCompletePercent: map['total_complete_percent']?.toInt() ?? 0,
      );

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
