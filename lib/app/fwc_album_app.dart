import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import 'core/rest/custom_dio.dart';
import 'core/ui/global/global_context.dart';
import 'core/ui/global/global_context_impl.dart';
import 'core/ui/theme/theme_config.dart';
import 'pages/auth/login/login_route.dart';
import 'pages/auth/register/register_route.dart';
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
    return FlutterGetItApplicationBinding(
      bindingsBuilder: () => [
        Bind.lazySingleton((_) => CustomDio()),
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(dio: i())),
        Bind.lazySingleton<GlobalContext>(
          (_) => GlobalContextImpl(navigatorKey: _navigatorKey),
        ),
      ],
      child: MaterialApp(
        title: 'Fifa World Cup Album',
        theme: ThemeConfig.theme,
        debugShowCheckedModeBanner: false,
        navigatorKey: _navigatorKey,
        routes: {
          '/': (_) => const SplashRoute(),
          '/auth/login': (_) => const LoginRoute(),
          '/auth/register': (_) => const RegisterRoute(),
          '/home': (_) => const HomeRoute(),
          '/my-stickers': (_) => const MyStickersRoute(),
          '/sticker-detail': (_) => const StickerDetailRoute(),
        },
      ),
    );
  }
}
