import 'package:flutter/widgets.dart';

import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../models/user_model.dart';
import '../home_page.dart';
import 'home_view.dart';

abstract base class HomeViewImpl extends State<HomePage>
    with Loader<HomePage>, Messages<HomePage>
    implements HomeView {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
    WidgetsBinding.instance
        .addPostFrameCallback((_) => widget.presenter.getUserData());
  }

  @override
  void onError(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void onLoading() {
    showLoader();
  }

  @override
  void onSuccessLogout() {
    hideLoader();
    Navigator.of(context)
        .pushNamedAndRemoveUntil<void>('/auth/login', (_) => false);
  }

  @override
  void updateUser(UserModel user) {
    hideLoader();
    setState(() => this.user = user);
  }
}
