import '../../../../core/mvp/fwc_presenter.dart';
import '../view/login_view.dart';

abstract class LoginPresenter extends FwcPresenter<LoginView> {
  Future<void> login({required String email, required String password});
}
