// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';

class SelectableListItem extends StatefulWidget {
  final String label;
  final Function()? onSelected;
  final bool isSelected;

  const SelectableListItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  State<SelectableListItem> createState() => _SelectableListItemState();
}

class _SelectableListItemState extends State<SelectableListItem> {
  @override
  Widget build(BuildContext context) {
    var color = widget.isSelected ? AppColors.orange : AppColors.black;

    return GestureDetector(
      onTap: widget.onSelected,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: AppColors.greyColor),
          ),
        ),
        child: ListTile(
          title: bodyText(widget.label, color: color),
          visualDensity: const VisualDensity(vertical: -4),
          trailing: widget.isSelected
              ? const Icon(
                  Icons.check,
                  color: AppColors.orange,
                )
              : const SizedBox(),
        ),
      ),
    );
  }
}
