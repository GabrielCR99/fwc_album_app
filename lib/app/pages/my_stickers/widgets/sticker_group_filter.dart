import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';
import 'package:flutter_getit/flutter_getit.dart';

import '../../../core/ui/styles/text_styles.dart';
import '../presenter/my_stickers_presenter.dart';

class StickerGroupFilter extends StatefulWidget {
  final Map<String, String> countries;

  const StickerGroupFilter({required this.countries, super.key});

  @override
  State<StickerGroupFilter> createState() => _StickerGroupFilterState();
}

class _StickerGroupFilterState extends State<StickerGroupFilter> {
  List<String>? selected;

  @override
  Widget build(BuildContext context) {
    final presenter = context.get<MyStickersPresenter>();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: SmartSelect<String>.multiple(
        title: 'Filtro',
        tileBuilder: (context, state) => InkWell(
          onTap: state.showModal,
          child: _StickerGroupTile(
            label: state.selected.title?.join(', ') ?? 'Filtro',
            clearCallback: () => setState(() {
              selected = null;
              presenter.countryFilter(selected);
            }),
          ),
        ),
        onChange: (selectedValue) => _onChangeSelect(selectedValue, presenter),
        selectedValue: selected ?? const [],
        choiceItems: S2Choice.listFrom(
          source: widget.countries.entries
              .map((e) => {'value': e.key, 'title': e.value})
              .toList(),
          value: (_, item) => item['value'] ?? '',
          title: (_, item) => item['title'] ?? '',
        ),
        choiceType: S2ChoiceType.switches,
        choiceGrouped: true,
        modalType: S2ModalType.bottomSheet,
        modalFilter: false,
        placeholder: '',
      ),
    );
  }

  void _onChangeSelect(
    S2MultiSelected<String> selectedValue,
    MyStickersPresenter presenter,
  ) {
    setState(() => selected = selectedValue.value);
    presenter.countryFilter(selected);
  }
}

class _StickerGroupTile extends StatelessWidget {
  final String label;
  final VoidCallback clearCallback;

  const _StickerGroupTile({required this.label, required this.clearCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xFFF0F0F0),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
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
            InkWell(
              onTap: clearCallback,
              child: const Icon(Icons.clear),
            ),
          ],
        ),
      ),
    );
  }
}
