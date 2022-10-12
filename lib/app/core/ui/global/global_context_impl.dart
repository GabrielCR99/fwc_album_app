import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../repositories/auth/auth_repository.dart';
import '../styles/colors_app.dart';
import 'global_context.dart';

class GlobalContextImpl implements GlobalContext {
  final GlobalKey<NavigatorState> _navigatorKey;
  final AuthRepository _authRepository;

  const GlobalContextImpl({
    required GlobalKey<NavigatorState> navigatorKey,
    required AuthRepository authRepository,
  })  : _navigatorKey = navigatorKey,
        _authRepository = authRepository;

  @override
  Future<void> loginExpire() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    showTopSnackBar(
      _navigatorKey.currentState!.context,
      CustomSnackBar.error(
        message: 'Sua sessão expirou!',
        backgroundColor: ColorsApp.i.primary,
      ),
      overlayState: _navigatorKey.currentState!.overlay,
    );
    _navigatorKey.currentState!.pushNamedAndRemoveUntil(
      '/auth/login',
      (_) => false,
    );
  }
}
