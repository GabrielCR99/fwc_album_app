import '../../../core/mvp/fwc_presenter.dart';
import '../view/splash_view.dart';

abstract interface class SplashPresenter implements FwcPresenter<SplashView> {
  Future<void> checkLogin();
}
