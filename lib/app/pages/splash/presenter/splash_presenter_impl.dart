import 'package:shared_preferences/shared_preferences.dart';

import '../view/splash_view.dart';
import 'splash_presenter.dart';

final class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;

  @override
  Future<void> checkLogin() async {
    _view.showLoader();
    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('access_token');

    _view.logged(isLogged: accessToken != null);
  }

  @override
  set view(SplashView view) => _view = view;

  @override
  SplashView get view => _view;
}
