import '../../../models/group_stickers.dart';

abstract class MyStickersView {
  void loadedPage(List<GroupStickers> groupStickers);
  void error(String message);
  void updateStatusFilter(String status);
  void updateAlbum(List<GroupStickers> groupStickers);
  void showLoader();
}
