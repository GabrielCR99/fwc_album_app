import 'package:flutter/cupertino.dart';

class ColorsApp {
  static ColorsApp? _instance;
  const ColorsApp._();

  static ColorsApp get i {
    _instance ??= const ColorsApp._();

    return _instance!;
  }

  Color get primary => const Color(0xFF791435);
  Color get secondary => const Color(0xFFFDCE50);
  Color get yellow => const Color(0xFFFDCE50);
  Color get grey => const Color(0xFFCCCCCC);
  Color get darkGrey => const Color(0xFF999999);
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colorsApp => ColorsApp.i;
}
