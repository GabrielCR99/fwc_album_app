import 'package:flutter/material.dart';

import '../../../core/ui/styles/app_colors.dart';
import '../../../core/ui/styles/text_styles.dart';

final class StatusTile extends StatelessWidget {
  final Image image;
  final String title;
  final int value;

  const StatusTile({
    required this.image,
    required this.title,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.7,
      child: ListTile(
        leading: SizedBox(
          width: 46,
          child: CircleAvatar(
            backgroundColor: context.appColors.grey,
            radius: 46,
            child: image,
          ),
        ),
        title: Text(
          title,
          style: context.textStyles.textPrimaryFontRegular
              .copyWith(color: Colors.white),
        ),
        trailing: Text(
          '$value',
          style: context.textStyles.textPrimaryFontMedium
              .copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
