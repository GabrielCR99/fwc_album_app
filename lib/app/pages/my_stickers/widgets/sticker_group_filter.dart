import 'package:flutter/material.dart';
import 'package:flutter_awesome_select_clone/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../../core/ui/styles/text_styles.dart';
import '../presenter/my_stickers_presenter.dart';

final class StickerGroupFilter extends StatefulWidget {
  final Map<String, String> countries;

  const StickerGroupFilter({required this.countries, super.key});

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

final class _StickerGroupFilterState extends State<StickerGroupFilter> {
  List<String>? selected;

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        title: 'Filtro',
        placeholder: '',
        selectedValue: selected ?? const [],
        onChange: (selectedValue) => selectedValue.value.isEmpty
            ? setState(() {
                selected = const [];
                presenter.countryFilter(widget.countries.keys.toList());
              })
            : _onChangeSelect(selectedValue),
        choiceItems: S2Choice.listFrom(
          source: widget.countries.entries
              .map((e) => {'value': e.key, 'title': e.value})
              .toList(),
          value: (_, item) => item['value'] ?? '',
          title: (_, item) => item['title'] ?? '',
        ),
        tileBuilder: (_, state) => InkWell(
          onTap: state.showModal,
          child: _StickerGroupTile(
            label: state.selected.title?.join(', ') ?? 'Filtro',
            clearCallback: () => setState(() {
              selected = null;
              presenter.countryFilter(selected);
            }),
          ),
        ),
        choiceType: S2ChoiceType.switches,
        choiceGrouped: true,
        modalType: S2ModalType.bottomSheet,
        modalFilter: false,
      ),
    );
  }

  void _onChangeSelect(S2MultiSelected<String> selectedValue) {
    setState(() => selected = selectedValue.value);
    context.get<MyStickersPresenter>().countryFilter(selected);
  }
}

class _StickerGroupTile extends StatelessWidget {
  final String label;
  final VoidCallback clearCallback;

  const _StickerGroupTile({required this.label, required this.clearCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF0F0F0),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            const Icon(Icons.filter_list),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                label,
                style: context.textStyles.textSecondaryFontRegular
                    .copyWith(fontSize: 11),
              ),
            ),
            InkWell(onTap: clearCallback, child: const Icon(Icons.clear)),
          ],
        ),
      ),
    );
  }
}
