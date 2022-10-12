import '../../models/group_stickers.dart';

abstract class StickersRepository {
  Future<List<GroupStickers>> getMyAlbum();
}
