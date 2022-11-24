import 'package:flutter/material.dart';

import 'presenter/my_stickers_presenter.dart';
import 'view/my_stickers_view_impl.dart';
import 'widgets/sticker_group.dart';
import 'widgets/sticker_group_filter.dart';
import 'widgets/sticker_status_filter.dart';

class MyStickersPage extends StatefulWidget {
  final MyStickersPresenter presenter;

  const MyStickersPage({required this.presenter, super.key});

  @override
  State<MyStickersPage> createState() => _MyStickersPageState();
}

class _MyStickersPageState extends MyStickersViewImpl {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minhas figurinhas')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                StickerStatusFilter(filterSelected: statusFilter),
                StickerGroupFilter(countries: countries),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: stickerGroups.length,
              (_, index) {
                final group = stickerGroups[index];

                return StickerGroup(group: group, statusFilter: statusFilter);
              },
            ),
          ),
        ],
      ),
    );
  }
}
