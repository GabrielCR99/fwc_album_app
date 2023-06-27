import '../../../core/mvp/fwc_presenter.dart';
import '../view/my_stickers_view.dart';

abstract interface class MyStickersPresenter
    implements FwcPresenter<MyStickersView> {
  Future<void> getMyAlbum();
  void statusFilter(String status);
  void countryFilter(List<String>? countries);
  Future<void> refresh();
}
