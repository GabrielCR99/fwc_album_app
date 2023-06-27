import 'dart:math';

import 'package:flutter/material.dart';

import '../../../core/ui/styles/app_colors.dart';
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
          decoration: BoxDecoration(
            color: context.appColors.grey,
            shape: BoxShape.circle,
          ),
          width: 70,
          height: 70,
          child: Center(
            child: Text(
              '$percent %',
              style: context.textStyles.titlePrimaryColor,
            ),
          ),
        ),
        SizedBox(
          width: 110,
          height: 110,
          child: Transform.rotate(
            angle: -pi / 2.5,
            child: CircularProgressIndicator(
              value: percent / 100,
              backgroundColor: Colors.white.withOpacity(0.5),
              color: Colors.white,
              strokeWidth: 5,
            ),
          ),
        ),
      ],
    );
  }
}
