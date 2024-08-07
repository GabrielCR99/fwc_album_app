import 'package:flutter/material.dart';

import '../styles/app_colors.dart';
import '../styles/text_styles.dart';

final theme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyles.i.labelTextField,
    isDense: true,
    contentPadding: const EdgeInsets.all(13),
    filled: true,
    fillColor: Colors.white,
    focusedBorder: _defaultInputBorder,
    enabledBorder: _defaultInputBorder,
    border: _defaultInputBorder,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.i.primary,
    primary: AppColors.i.primary,
    secondary: AppColors.i.secondary,
  ),
  primaryColor: AppColors.i.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.black),
    centerTitle: true,
    titleTextStyle: TextStyles.i.textPrimaryFontBold
        .copyWith(fontSize: 18, color: Colors.black),
  ),
);

final _defaultInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: AppColors.i.darkGrey),
  borderRadius: const BorderRadius.all(Radius.circular(18)),
);
