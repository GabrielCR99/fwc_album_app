import 'package:flutter/material.dart';

import 'app_colors.dart';

final class TextStyles {
  static TextStyles? _instance;
  const TextStyles._();

  static TextStyles get i {
    _instance ??= const TextStyles._();

    return _instance!;
  }

  String get primaryFontFamily => 'Poppins';
  String get secondaryFontFamily => 'MPlus1P';

  TextStyle get textPrimaryFontRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: primaryFontFamily);
  TextStyle get textPrimaryFontMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: primaryFontFamily);
  TextStyle get textPrimaryFontSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: primaryFontFamily);
  TextStyle get textPrimaryFontBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: primaryFontFamily);
  TextStyle get textPrimaryFontExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: primaryFontFamily);

  TextStyle get textSecondaryFontRegular =>
      TextStyle(fontWeight: FontWeight.normal, fontFamily: secondaryFontFamily);
  TextStyle get textSecondaryFontMedium =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: secondaryFontFamily);
  TextStyle get textSecondaryFontBold =>
      TextStyle(fontWeight: FontWeight.bold, fontFamily: secondaryFontFamily);
  TextStyle get textSecondaryFontExtraBold =>
      TextStyle(fontWeight: FontWeight.w800, fontFamily: secondaryFontFamily);

  TextStyle get labelTextField => textSecondaryFontRegular.copyWith(
        color: AppColors.i.darkGrey,
      );

  TextStyle get textSecondaryFontExtraBoldPrimaryColor =>
      textSecondaryFontExtraBold.copyWith(color: AppColors.i.primary);

  TextStyle get titleWhite =>
      textPrimaryFontBold.copyWith(color: Colors.white, fontSize: 22);

  TextStyle get titleBlack =>
      textPrimaryFontBold.copyWith(fontSize: 22, color: Colors.black);

  TextStyle get titlePrimaryColor =>
      textPrimaryFontBold.copyWith(color: AppColors.i.primary, fontSize: 22);
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
