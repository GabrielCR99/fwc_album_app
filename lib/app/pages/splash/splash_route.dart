import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'presenter/splash_presenter.dart';
import 'presenter/splash_presenter_impl.dart';
import 'splash_page.dart';

final class SplashRoute extends FlutterGetItPageRouter {
  const SplashRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<SplashPresenter>((_) => SplashPresenterImpl()),
      ];

  @override
  WidgetBuilder get view => (context) => SplashPage(presenter: context.get());

  @override
  String get routeName => '/';
}
