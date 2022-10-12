import '../../../core/mvp/fwc_presenter.dart';
import '../view/home_view.dart';

abstract class HomePresenter extends FwcPresenter<HomeView> {
  Future<void> getUserData();
  Future<void> logout();
}
