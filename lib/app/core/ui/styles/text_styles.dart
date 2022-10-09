import 'package:flutter/material.dart';
import 'colors_app.dart';

class TextStyles {
  static TextStyles? _instance;
  const TextStyles._();

  static TextStyles get i {
    _instance ??= const TextStyles._();

    return _instance!;
  }

  String get primaryFontFamily => 'Poppins';
  String get secondaryFontFamily => 'MPlus1P';

  TextStyle get textPrimaryFontRegular => TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.normal,
      );
  TextStyle get textPrimaryFontMedium => TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w500,
      );
  TextStyle get textPrimaryFontSemiBold => TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w600,
      );
  TextStyle get textPrimaryFontBold => TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.bold,
      );
  TextStyle get textPrimaryFontExtraBold => TextStyle(
        fontFamily: primaryFontFamily,
        fontWeight: FontWeight.w800,
      );

  TextStyle get textSecondaryFontRegular => TextStyle(
        fontFamily: secondaryFontFamily,
        fontWeight: FontWeight.normal,
      );
  TextStyle get textSecondaryFontMedium => TextStyle(
        fontFamily: secondaryFontFamily,
        fontWeight: FontWeight.w600,
      );
  TextStyle get textSecondaryFontBold => TextStyle(
        fontFamily: secondaryFontFamily,
        fontWeight: FontWeight.bold,
      );
  TextStyle get textSecondaryFontExtraBold => TextStyle(
        fontFamily: secondaryFontFamily,
        fontWeight: FontWeight.w800,
      );

  TextStyle get labelTextField => textSecondaryFontRegular.copyWith(
        color: ColorsApp.i.darkGrey,
      );

  TextStyle get textSecondaryFontExtraBoldPrimaryColor =>
      textSecondaryFontExtraBold.copyWith(color: ColorsApp.i.primary);

  TextStyle get titleWhite =>
      textPrimaryFontBold.copyWith(color: Colors.white, fontSize: 22);

  TextStyle get titleBack =>
      textPrimaryFontBold.copyWith(fontSize: 22, color: Colors.black);
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.i;
}
