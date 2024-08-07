import 'package:flutter/widgets.dart';

import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../models/group_stickers.dart';
import '../my_stickers_page.dart';
import 'my_stickers_view.dart';

abstract base class MyStickersViewImpl extends State<MyStickersPage>
    with Messages<MyStickersPage>, Loader<MyStickersPage>
    implements MyStickersView {
  var stickerGroups = <GroupStickers>[];
  var statusFilter = 'all';
  var countries = <String, String>{};

  @override
  void initState() {
    super.initState();
    widget.presenter.view = this;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showLoader();
      widget.presenter.getMyAlbum();
    });
  }

  @override
  void error(String message) => showError(message);

  @override
  void loadedPage(List<GroupStickers> groupStickers) {
    hideLoader();
    setState(() {
      stickerGroups = groupStickers;
      countries = {
        for (final group in groupStickers) group.countryCode: group.countryName,
      };
    });
  }

  @override
  void updateStatusFilter(String status) {
    setState(() => statusFilter = status);
  }

  @override
  void updateAlbum(List<GroupStickers> groupStickers) {
    hideLoader();
    setState(() => stickerGroups = groupStickers);
  }
}
