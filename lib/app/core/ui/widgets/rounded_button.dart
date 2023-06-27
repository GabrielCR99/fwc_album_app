import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundedButton({required this.icon, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      color: Colors.grey.withOpacity(0.2),
      shape: const CircleBorder(),
      child: DecoratedBox(
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: context.appColors.darkGrey),
        ),
      ),
    );
  }
}
