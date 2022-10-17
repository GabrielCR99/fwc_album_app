import 'package:flutter/material.dart';

import '../../core/ui/styles/button_styles.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/button.dart';
import '../../core/ui/widgets/rounded_button.dart';
import 'presenter/sticker_detail_presenter.dart';
import 'view/sticker_detail_view_impl.dart';

class StickerDetailPage extends StatefulWidget {
  final StickerDetailPresenter presenter;

  const StickerDetailPage({required this.presenter, super.key});

  @override
  State<StickerDetailPage> createState() => _StickerDetailPageState();
}

class _StickerDetailPageState extends StickerDetailViewImpl {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe Figurinha'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: screenWidth,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                hasSticker
                    ? 'assets/images/sticker.png'
                    : 'assets/images/sticker_pb.png',
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      '$countryCode $stickerNumber',
                      style: context.textStyles.textPrimaryFontBold
                          .copyWith(fontSize: 22),
                    ),
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
              Container(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  countryName,
                  style: context.textStyles.textPrimaryFontRegular,
                ),
              ),
              Button.primary(
                onPressed: widget.presenter.saveSticker,
                label:
                    hasSticker ? 'Atualizar figurinha' : 'Adicionar figurinhas',
                width: screenWidth * 0.9,
              ),
              Button(
                onPressed: widget.presenter.deleteSticker,
                style: context.buttonStyles.primaryOutlineButton,
                labelStyle:
                    context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                label: 'Excluir figurinha',
                width: screenWidth * 0.9,
                outline: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
