import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../styles/colors_app.dart';

mixin Messages<T extends StatefulWidget> on State<T> {
  void showSuccess(String message) =>
      showTopSnackBar(context, CustomSnackBar.success(message: message));

  void showInfo(String message) => showTopSnackBar(
        context,
        CustomSnackBar.info(
          message: message,
        ),
      );

  void showError(String message) => showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: message,
          backgroundColor: context.colorsApp.primary,
        ),
      );
}
