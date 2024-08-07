import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../repositories/stickers/stickers_repository.dart';
import '../../repositories/stickers/stickers_repository_impl.dart';
import 'my_stickers_page.dart';
import 'presenter/my_stickers_presenter.dart';
import 'presenter/my_stickers_presenter_impl.dart';

final class MyStickersRoute extends FlutterGetItPageRouter {
  const MyStickersRoute({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<StickersRepository>(
          (i) => StickersRepositoryImpl(dio: i()),
        ),
        Bind.lazySingleton<MyStickersPresenter>(
          (i) => MyStickersPresenterImpl(stickersRepository: i()),
        ),
      ];

  @override
  WidgetBuilder get view =>
      (context) => MyStickersPage(presenter: context.get());

  @override
  String get routeName => '/my-stickers';
}
