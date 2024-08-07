import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

base mixin Loader<T extends StatefulWidget> on State<T> {
  var _isOpen = false;

  void showLoader() {
    if (!_isOpen) {
      _isOpen = true;

      showDialog<void>(
        context: context,
        builder: (_) => LoadingAnimationWidget.threeArchedCircle(
          color: Colors.white,
          size: 80,
        ),
        barrierDismissible: false,
      );
    }
  }

  void hideLoader() {
    if (_isOpen) {
      _isOpen = false;
      Navigator.of(context).pop<void>();
    }
  }
}
