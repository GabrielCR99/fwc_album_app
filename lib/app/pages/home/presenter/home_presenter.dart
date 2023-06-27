import '../../../core/mvp/fwc_presenter.dart';
import '../view/home_view.dart';

abstract interface class HomePresenter implements FwcPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}
