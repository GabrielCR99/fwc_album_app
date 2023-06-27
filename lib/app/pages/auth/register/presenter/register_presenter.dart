import '../../../../core/mvp/fwc_presenter.dart';
import '../view/register_view.dart';

abstract class RegisterPresenter implements FwcPresenter<RegisterView> {
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  });
}
