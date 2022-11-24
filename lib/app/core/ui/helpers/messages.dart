import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../styles/app_colors.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  late final _overlay = Navigator.of(context).overlay!;

  void showSuccess(String message) =>
      showTopSnackBar(_overlay, CustomSnackBar.success(message: message));

  void showInfo(String message) =>
      showTopSnackBar(_overlay, CustomSnackBar.info(message: message));

  void showError(String message) => showTopSnackBar(
        _overlay,
        CustomSnackBar.error(
          message: message,
          backgroundColor: context.appColors.primary,
        ),
      );
}
