import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../styles/app_colors.dart';
import 'global_context.dart';

class GlobalContextImpl implements GlobalContext {
  final GlobalKey<NavigatorState> _navigatorKey;

  const GlobalContextImpl({required GlobalKey<NavigatorState> navigatorKey})
      : _navigatorKey = navigatorKey;

  @override
  Future<void> loginExpire() async {
    final sp = await SharedPreferences.getInstance();
    await sp.clear();
    showTopSnackBar(
      _navigatorKey.currentState!.context,
      CustomSnackBar.error(
        message: 'Sua sessão expirou! Faça o login novamente.',
        backgroundColor: AppColors.i.primary,
      ),
      overlayState: _navigatorKey.currentState!.overlay,
    );
    _navigatorKey.currentState!.pushNamedAndRemoveUntil(
      '/auth/login',
      (_) => false,
    );
  }
}
