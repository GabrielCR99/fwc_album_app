import 'package:flutter/widgets.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../login_page.dart';
import 'login_view.dart';

abstract base class LoginViewImpl extends State<LoginPage>
    with Messages<LoginPage>, Loader<LoginPage>
    implements LoginView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void onLoginError(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void onLoginSuccess() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (_) => false);
  }
}
