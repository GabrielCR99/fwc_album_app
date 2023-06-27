import '../../../../core/mvp/fwc_presenter.dart';
import '../view/login_view.dart';

abstract interface class LoginPresenter implements FwcPresenter<LoginView> {
  Future<void> login({required String email, required String password});
}
