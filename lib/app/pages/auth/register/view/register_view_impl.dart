import 'package:flutter/widgets.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../register_page.dart';
import 'register_view.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Messages<RegisterPage>, Loader<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
  }

  @override
  void onRegisterError([String? error]) {
    hideLoader();
    showError(error ?? 'Erro ao cadastrar usuário');
  }

  @override
  void onRegisterSuccess() {
    hideLoader();
    showSuccess('Usuário cadastrado com sucesso');
    Navigator.of(context).pop();
  }
}
