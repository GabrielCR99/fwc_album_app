import 'package:flutter/material.dart';

import '../../core/ui/styles/app_colors.dart';
import '../../core/ui/styles/button_styles.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/button.dart';
import 'presenter/splash_presenter.dart';
import 'view/splash_view_impl.dart';

final class SplashPage extends StatefulWidget {
  final SplashPresenter presenter;

  const SplashPage({required this.presenter, super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

final class _SplashPageState extends SplashViewImpl {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: screenSize.height * 0.08),
                child: Image.asset(
                  'assets/images/fifa_logo.png',
                  height: screenSize.height * 0.25,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: screenSize.height * 0.19),
                child: Button(
                  style: context.buttonStyles.yellowButton,
                  labelStyle:
                      context.textStyles.textSecondaryFontExtraBoldPrimaryColor,
                  label: 'Acessar',
                  width: screenSize.width * 0.9,
                  onPressed: widget.presenter.checkLogin,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset('assets/images/flags.png'),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: context.appColors.primary,
    );
  }
}
