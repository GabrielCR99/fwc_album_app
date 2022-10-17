import 'package:shared_preferences/shared_preferences.dart';

import '../../../repositories/user/user_repository.dart';
import '../view/home_view.dart';
import 'home_presenter.dart';

class HomePresenterImpl implements HomePresenter {
  final UserRepository _repository;
  late final HomeView _view;

  HomePresenterImpl({required UserRepository repository})
      : _repository = repository;

  @override
  Future<void> getUserData() async {
    _view.onLoading();
    try {
      final user = await _repository.getMe();
      _view.updateUser(user);
    } catch (_) {
      _view.onError('Erro ao buscar dados do usuário');
    }
  }

  @override
  Future<void> logout() async {
    _view.onLoading();
    final sp = await SharedPreferences.getInstance();
    await sp.clear();
    _view.onSuccessLogout();
  }

  @override
  set view(HomeView view) => _view = view;
}
