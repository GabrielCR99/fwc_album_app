import 'package:flutter/cupertino.dart';

final class AppColors {
  static AppColors? _instance;
  const AppColors._();

  static AppColors get i {
    _instance ??= const AppColors._();

    return _instance!;
  }

  Color get primary => const Color(0xFF791435);
  Color get secondary => const Color(0xFFFDCE50);
  Color get yellow => const Color(0xFFFDCE50);
  Color get grey => const Color(0xFFCCCCCC);
  Color get darkGrey => const Color(0xFF999999);
}

extension AppColorsExtension on BuildContext {
  AppColors get appColors => AppColors.i;
}
