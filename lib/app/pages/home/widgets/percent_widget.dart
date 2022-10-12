import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';

class PercentWidget extends StatelessWidget {
  final int percent;

  const PercentWidget({required this.percent, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: context.colorsApp.grey,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '$percent %',
              style: context.textStyles.titlePrimaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 110,
          width: 110,
          child: Transform.rotate(
            angle: -pi / 2.5,
            child: CircularProgressIndicator(
              color: Colors.white,
              backgroundColor: Colors.white.withOpacity(0.5),
              strokeWidth: 5,
              value: percent / 100,
            ),
          ),
        ),
      ],
    );
  }
}
