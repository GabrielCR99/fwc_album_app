import 'package:flutter/widgets.dart';

import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../models/user_sticker_model.dart';
import '../sticker_detail_page.dart';
import 'sticker_detail_view.dart';

abstract base class StickerDetailViewImpl extends State<StickerDetailPage>
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLoader();
      final arguments =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

      if (arguments
          case {
            'countryCode': final String countryCode,
            'stickerNumber': final String stickerNumber,
            'countryName': final String countryName,
            'stickerUser': final UserStickerModel? stickerUser,
          }) {
        widget.presenter.load(
          countryCode: countryCode,
          stickerNumber: stickerNumber,
          countryName: countryName,
          stickerUser: stickerUser,
        );
      } else {
        hideLoader();
        Navigator.of(context).pop<void>();
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
    setState(
      () => this
        ..hasSticker = hasSticker
        ..countryCode = countryCode
        ..stickerNumber = stickerNumber
        ..countryName = countryName
        ..amount = amount,
    );
  }

  @override
  void updateAmount(int amount) => setState(() => this.amount = amount);

  @override
  void saveSuccess() {
    hideLoader();
    Navigator.of(context).pop<void>();
  }

  @override
  void error(String error) {
    hideLoader();
    showError(error);
  }
}
