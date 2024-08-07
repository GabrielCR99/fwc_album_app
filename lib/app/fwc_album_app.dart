import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'core/rest/custom_dio.dart';
import 'core/ui/global/global_context.dart';
import 'core/ui/global/global_context_impl.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/auth/auth_module.dart';
import 'pages/home/home_route.dart';
import 'pages/my_stickers/my_stickers_route.dart';
import 'pages/splash/splash_route.dart';
import 'pages/sticker_detail/sticker_detail_route.dart';
import 'repositories/auth/auth_repository.dart';
import 'repositories/auth/auth_repository_impl.dart';

class FwcAlbumApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  FwcAlbumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      builder: (_, routes, ___) => MaterialApp(
        navigatorKey: _navigatorKey,
        routes: routes,
        title: 'Fifa World Cup Album',
        theme: theme,
        debugShowCheckedModeBanner: false,
      ),
      bindingsBuilder: () => [
        Bind.lazySingleton((_) => CustomDio()),
        Bind.lazySingleton<AuthRepository>(
          (i) => AuthRepositoryImpl(dio: i()),
        ),
        Bind.lazySingleton<GlobalContext>(
          (_) => GlobalContextImpl(navigatorKey: _navigatorKey),
        ),
      ],
      modules: [AuthModule()],
      pages: const [
        StickerDetailRoute(),
        SplashRoute(),
        HomeRoute(),
        MyStickersRoute(),
      ],
    );
  }
}
