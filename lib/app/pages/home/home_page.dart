import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../core/ui/styles/app_colors.dart';
import '../../core/ui/styles/button_styles.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/ui/widgets/button.dart';
import 'presenter/home_presenter.dart';
import 'view/home_view_impl.dart';
import 'widgets/percent_widget.dart';
import 'widgets/status_tile.dart';

class HomePage extends StatefulWidget {
  final HomePresenter presenter;

  const HomePage({required this.presenter, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends HomeViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.appColors.primary,
        actions: [
          IconButton(
            onPressed: widget.presenter.logout,
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) => ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 35),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/images/bola.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    PercentWidget(percent: user?.totalCompletePercent ?? 0),
                    const SizedBox(height: 20),
                    Text(
                      '${user?.totalStickers ?? 0} figurinhas',
                      style: context.textStyles.titleWhite,
                    ),
                    const SizedBox(height: 20),
                    StatusTile(
                      image: Image.asset('assets/images/all_icon.png'),
                      title: 'Todas',
                      value: user?.totalAlbum ?? 0,
                    ),
                    const SizedBox(height: 20),
                    StatusTile(
                      image: Image.asset('assets/images/missing_icon.png'),
                      title: 'Faltando',
                      value: user?.totalComplete ?? 0,
                    ),
                    const SizedBox(height: 20),
                    StatusTile(
                      image: Image.asset('assets/images/repeated_icon.png'),
                      title: 'Repetidas',
                      value: user?.totalDuplicates ?? 0,
                    ),
                    const SizedBox(height: 20),
                    Button(
                      onPressed: () => _goToMyStickers(context),
                      outline: true,
                      style: context.buttonStyles.yellowOutlineButton,
                      labelStyle: context.textStyles.textSecondaryFontExtraBold
                          .copyWith(color: context.appColors.yellow),
                      label: 'Minhas figurinhas',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _goToMyStickers(BuildContext context) async {
    final presenter = context.get<HomePresenter>();

    await Navigator.of(context).pushNamed('/my-stickers');

    presenter.getUserData();
  }
}
