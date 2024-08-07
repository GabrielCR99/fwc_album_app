import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../services/sticker/find_sticer_service_impl.dart';
import '../../services/sticker/find_sticker_service.dart';
import 'presenter/sticker_detail_presenter.dart';
import 'presenter/sticker_detail_presenter_impl.dart';
import 'sticker_detail_page.dart';

class StickerDetailRoute extends FlutterGetItPageRouter {
  const StickerDetailRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<FindStickerService>(
          (i) => FindSticerServiceImpl(stickersRepository: i()),
        ),
        Bind.lazySingleton<StickerDetailPresenter>(
          (i) => StickerDetailPresenterImpl(
            findSticerService: i(),
            stickersRepository: i(),
          ),
        ),
      ];

  @override
  WidgetBuilder get view =>
      (context) => StickerDetailPage(presenter: context.get());

  @override
  String get routeName => '/sticker-detail';
}
