import 'package:delivery_app/src/features/presentation/filter_page/view/custom_widgets/selectable_list_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SingleSelectableListTile extends StatefulWidget {
  final List<String> items;
  late String _selected;

  SingleSelectableListTile({
    super.key,
    required this.items,
  }) {
    _selected = items[0];
  }

  @override
  State<SingleSelectableListTile> createState() => _SingleSelectableListTileState();
}

class _SingleSelectableListTileState extends State<SingleSelectableListTile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 3,
        children: List.generate(
          widget.items.length,
          (index) {
            return SelectableListItem(
              label: widget.items[index],
              isSelected: widget._selected == widget.items[index],
              onSelected: () {
                setState(() => widget._selected = widget.items[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
