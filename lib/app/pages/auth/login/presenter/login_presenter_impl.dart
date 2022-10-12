import 'dart:developer';

import '../../../../core/exceptions/unauthorized_exception.dart';
import '../../../../services/login/login_service.dart';
import '../view/login_view.dart';
import 'login_presenter.dart';

class LoginPresenterImpl implements LoginPresenter {
  final LoginService _loginService;
  late final LoginView _view;

  LoginPresenterImpl({required LoginService loginService})
      : _loginService = loginService;

  @override
  Future<void> login({required String email, required String password}) async {
    try {
      await _loginService.execute(email: email, password: password);
      _view.onLoginSuccess();
    } on UnauthorizedException catch (e, s) {
      log('Usuário ou senha inválidos', error: e, stackTrace: s);
      _view.onLoginError('Usuário ou senha inválidos');
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      _view.onLoginError('Erro ao realizar login');
    }
  }

  @override
  set view(LoginView view) => _view = view;
}
