import 'package:delivery_app/src/features/presentation/filter_page/view/custom_widgets/selectable_list_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MultiSelectableListTile extends StatefulWidget {
  final List<String> items;

  const MultiSelectableListTile({
    super.key,
    required this.items,
  });

  @override
  State<MultiSelectableListTile> createState() => _MultiSelectableListTileState();
}

class _MultiSelectableListTileState extends State<MultiSelectableListTile> {
  final List<String> _selected = [];

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
              isSelected: _selected.contains(widget.items[index]),
              onSelected: () {
                setState(
                  () {
                    if (!_selected.contains(widget.items[index])) {
                      _selected.add(widget.items[index]);
                    } else {
                      _selected.removeWhere((String name) {
                        return name == widget.items[index];
                      });
                    }
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
