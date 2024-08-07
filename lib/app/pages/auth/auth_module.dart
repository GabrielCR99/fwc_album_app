import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../services/login/login_service.dart';
import '../../services/login/login_service_impl.dart';
import 'login/login_page.dart';
import 'login/presenter/login_presenter.dart';
import 'login/presenter/login_presenter_impl.dart';
import 'register/presenter/register_presenter.dart';
import 'register/presenter/register_presenter_impl.dart';
import 'register/register_page.dart';

final class AuthModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<LoginService>(
          (i) => LoginServiceImpl(authRepository: i()),
        ),
        Bind.lazySingleton<LoginPresenter>(
          (i) => LoginPresenterImpl(loginService: i()),
        ),
        Bind.lazySingleton<RegisterPresenter>(
          (i) => RegisterPresenterImpl(repository: i()),
        ),
      ];

  @override
  String get moduleRouteName => '/auth';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/login': (context) => LoginPage(presenter: context.get()),
        '/register': (context) => RegisterPage(presenter: context.get()),
      };
}
