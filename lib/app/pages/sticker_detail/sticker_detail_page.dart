import 'package:flutter/material.dart';

import '../../core/ui/styles/button_styles.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/button.dart';
import '../../core/ui/widgets/rounded_button.dart';
import 'presenter/sticker_detail_presenter.dart';
import 'view/sticker_detail_view_impl.dart';

final class StickerDetailPage extends StatefulWidget {
  final StickerDetailPresenter presenter;

  const StickerDetailPage({required this.presenter, super.key});

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

final class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalhe Figurinha'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Image.asset(
            hasSticker
                ? 'assets/images/sticker.png'
                : 'assets/images/sticker_pb.png',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Text(
                  '$countryCode $stickerNumber',
                  style: context.textStyles.textPrimaryFontBold
                      .copyWith(fontSize: 22),
                ),
                const Spacer(),
                RoundedButton(
                  icon: Icons.remove,
                  onPressed: widget.presenter.decrementAmount,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    '$amount',
                    style: context.textStyles.textSecondaryFontMedium,
                  ),
                ),
                RoundedButton(
                  icon: Icons.add,
                  onPressed: widget.presenter.incrementAmount,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              countryName,
              style: context.textStyles.textPrimaryFontRegular,
            ),
          ),
          Button.primary(
            label: hasSticker ? 'Atualizar figurinha' : 'Adicionar figurinhas',
            width: screenWidth * 0.9,
            onPressed: widget.presenter.saveSticker,
          ),
          Button(
            style: context.buttonStyles.primaryOutlineButton,
            labelStyle:
                context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
            label: 'Excluir figurinha',
            width: screenWidth * 0.9,
            onPressed: widget.presenter.deleteSticker,
            outline: true,
          ),
        ],
      ),
    );
  }
}
