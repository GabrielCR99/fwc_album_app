import 'package:flutter/cupertino.dart';

import '../../../core/ui/helpers/loader.dart';
import '../splash_page.dart';
import 'splash_view.dart';

abstract base class SplashViewImpl extends State<SplashPage>
    with Loader<SplashPage>
    implements SplashView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void logged({bool isLogged = false}) {
    hideLoader();
    if (isLogged) {
      _navigateTo('/home');
    } else {
      _navigateTo('/auth/login');
    }
  }

  void _navigateTo(String route) =>
      Navigator.of(context).pushNamedAndRemoveUntil(route, (_) => false);
}
