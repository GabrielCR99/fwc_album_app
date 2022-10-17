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

    final screenSize = MediaQuery.of(context).size;
    final buttonWidth = screenSize.width * 0.3;

    return Container(
      width: screenSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 5,
        children: [
          Button(
            width: buttonWidth,
            onPressed: () => presenter.statusFilter('all'),
            style: filterSelected == 'all'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'all'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.appColors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Todas',
          ),
          Button(
            width: buttonWidth,
            onPressed: () => presenter.statusFilter('missing'),
            style: filterSelected == 'missing'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'missing'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.appColors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Faltando',
          ),
          Button(
            width: buttonWidth,
            onPressed: () => presenter.statusFilter('repeated'),
            style: filterSelected == 'repeated'
                ? context.buttonStyles.yellowButton
                : context.buttonStyles.primaryButton,
            labelStyle: filterSelected == 'repeated'
                ? context.textStyles.textSecondaryFontMedium
                    .copyWith(color: context.appColors.primary)
                : context.textStyles.textSecondaryFontMedium,
            label: 'Repetidas',
          ),
        ],
      ),
    );
  }
}
