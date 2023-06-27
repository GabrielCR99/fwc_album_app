import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../../core/ui/styles/app_colors.dart';
import '../../../core/ui/styles/button_styles.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/widgets/button.dart';
import '../presenter/my_stickers_presenter.dart';

class StickerStatusFilter extends StatelessWidget {
  final String filterSelected;

  const StickerStatusFilter({required this.filterSelected, super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();

    final screenSize = MediaQuery.sizeOf(context);
    final buttonWidth = screenSize.width * 0.3;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: screenSize.width,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            style: filterSelected == 'all'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'all'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.appColors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Todas',
            width: buttonWidth,
            onPressed: () => presenter.statusFilter('all'),
          ),
          Button(
            style: filterSelected == 'missing'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'missing'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.appColors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Faltando',
            width: buttonWidth,
            onPressed: () => presenter.statusFilter('missing'),
          ),
          Button(
            style: filterSelected == 'repeated'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'repeated'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.appColors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Repetidas',
            width: buttonWidth,
            onPressed: () => presenter.statusFilter('repeated'),
          ),
        ],
      ),
    );
  }
}
