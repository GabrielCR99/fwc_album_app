import 'dart:developer';

import '../../../../core/exceptions/repository_exception.dart';
import '../../../../models/register_user_model.dart';
import '../../../../repositories/auth/auth_repository.dart';
import '../view/register_view.dart';
import 'register_presenter.dart';

class RegisterPresenterImpl implements RegisterPresenter {
  final AuthRepository _repository;
  late final RegisterView _view;

  RegisterPresenterImpl({required AuthRepository repository})
      : _repository = repository;

  @override
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    final registerUserModel = RegisterUserModel(
      name: name,
      email: email,
      password: password,
      passwordConfirmation: confirmPassword,
    );

    try {
      await _repository.register(registerUserModel);
      _view.onRegisterSuccess();
    } on RepositoryException catch (e) {
      log(e.message);
      _view.onRegisterError(e.message);
    }
  }

  @override
  set view(RegisterView view) => _view = view;
}
