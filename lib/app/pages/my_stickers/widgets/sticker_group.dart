import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../../core/ui/styles/app_colors.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/widgets/nil.dart';
import '../../../models/group_stickers.dart';
import '../../../models/user_sticker_model.dart';
import '../presenter/my_stickers_presenter.dart';

final class StickerGroup extends StatelessWidget {
  final GroupStickers group;
  final String statusFilter;

  const StickerGroup({
    required this.group,
    required this.statusFilter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: ClipRect(
                child: Align(
                  alignment: const Alignment(0, -0.1),
                  widthFactor: 1,
                  heightFactor: 0.1,
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: group.flag,
                    imageCacheWidth:
                        (MediaQuery.sizeOf(context).width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              group.countryName,
              style: context.textStyles.titleBlack.copyWith(fontSize: 26),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (_, index) {
              final stickerNumber = '${group.stickerStart + index}';
              final stickerList = group.stickers
                  .where((element) => element.stickerNumber == stickerNumber);
              final sticker = stickerList.isNotEmpty ? stickerList.first : null;
              final stickerWidget = _Sticker(
                sticker: sticker,
                stickerNumber: stickerNumber,
                countryName: group.countryName,
                countryCode: group.countryCode,
              );
              if (statusFilter == 'all') {
                return stickerWidget;
              } else if (statusFilter == 'missing') {
                if (sticker == null) {
                  return stickerWidget;
                }
              } else if (statusFilter == 'repeated') {
                if (sticker != null && sticker.duplicate > 0) {
                  return stickerWidget;
                }
              }

              return const Nil();
            },
            itemCount: 20,
          ),
        ],
      ),
    );
  }
}

class _Sticker extends StatelessWidget {
  final String stickerNumber;
  final UserStickerModel? sticker;
  final String countryName;
  final String countryCode;

  const _Sticker({
    required this.sticker,
    required this.stickerNumber,
    required this.countryName,
    required this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToStickerDetail(context),
      child: ColoredBox(
        color: sticker != null
            ? context.appColors.primary
            : context.appColors.grey,
        child: Column(
          children: [
            Visibility(
              visible: (sticker?.duplicate ?? 0) > 0,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: Text(
                  '${sticker?.duplicate ?? ''}',
                  style: context.textStyles.textSecondaryFontMedium
                      .copyWith(color: context.appColors.yellow),
                ),
              ),
            ),
            Text(
              countryCode,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black,
              ),
            ),
            Text(
              stickerNumber,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToStickerDetail(BuildContext context) async {
    final presenter = context.get<MyStickersPresenter>();
    await Navigator.of(context).pushNamed<void>(
      '/sticker-detail',
      arguments: {
        'countryCode': countryCode,
        'stickerNumber': stickerNumber,
        'countryName': countryName,
        'stickerUser': sticker,
      },
    );
    presenter.refresh();
  }
}
