import 'dart:async';

import 'package:flutter/widgets.dart';

import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../models/user_sticker_model.dart';
import '../sticker_detail_page.dart';
import 'sticker_detail_view.dart';

abstract class StickerDetailViewImpl extends State<StickerDetailPage>
    with Loader<StickerDetailPage>, Messages<StickerDetailPage>
    implements StickerDetailView {
  bool hasSticker = false;
  String countryCode = '';
  String stickerNumber = '';
  String countryName = '';
  int amount = 0;

  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
    scheduleMicrotask(() {
      showLoader();
      final arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (arguments != null) {
        widget.presenter.load(
          countryCode: arguments['countryCode'] as String,
          stickerNumber: arguments['stickerNumber'] as String,
          countryName: arguments['countryName'] as String,
          stickerUser: arguments['stickerUser'] as UserStickerModel?,
        );
      } else {
        hideLoader();
        Navigator.of(context).pop();
        showError('Não foi possível carregar a figurinha');
      }
    });
  }

  @override
  void screenLoaded(
    String countryCode,
    String stickerNumber,
    String countryName,
    int amount, {
    required bool hasSticker,
  }) {
    hideLoader();
    setState(() {
      this.hasSticker = hasSticker;
      this.countryCode = countryCode;
      this.stickerNumber = stickerNumber;
      this.countryName = countryName;
      this.amount = amount;
    });
  }

  @override
  void updateAmount(int amount) => setState(() => this.amount = amount);

  @override
  void saveSuccess() {
    hideLoader();
    Navigator.of(context).pop();
  }

  @override
  void error(String error) {
    hideLoader();
    showError(error);
  }
}
