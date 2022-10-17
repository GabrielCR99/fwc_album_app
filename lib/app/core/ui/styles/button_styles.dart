import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_styles.dart';

class ButtonStyles {
  static ButtonStyles? _instance;
  const ButtonStyles._();

  static ButtonStyles get i {
    _instance ??= const ButtonStyles._();

    return _instance!;
  }

  ButtonStyle get yellowButton => ElevatedButton.styleFrom(
        backgroundColor: AppColors.i.yellow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        textStyle:
            TextStyles.i.textSecondaryFontExtraBold.copyWith(fontSize: 14),
      );

  ButtonStyle get yellowOutlineButton => OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        side: BorderSide(color: AppColors.i.yellow),
        textStyle:
            TextStyles.i.textSecondaryFontExtraBold.copyWith(fontSize: 14),
      );

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        backgroundColor: AppColors.i.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        textStyle:
            TextStyles.i.textSecondaryFontExtraBold.copyWith(fontSize: 14),
      );

  ButtonStyle get primaryOutlineButton => OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        side: BorderSide(color: AppColors.i.primary),
        textStyle:
            TextStyles.i.textSecondaryFontExtraBold.copyWith(fontSize: 14),
      );
}

extension ButtonStylesExtension on BuildContext {
  ButtonStyles get buttonStyles => ButtonStyles.i;
}
