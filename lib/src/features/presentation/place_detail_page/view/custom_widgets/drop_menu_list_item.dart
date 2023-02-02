import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/cards/item_vertical_card.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropMenuListItem extends StatefulWidget {
  final String label;
  final int quantity;
  late bool isSelected;

  DropMenuListItem({
    super.key,
    required this.label,
    required this.quantity,
  }) {
    isSelected = false;
  }

  @override
  State<DropMenuListItem> createState() => _DropMenuListItemState();
}

class _DropMenuListItemState extends State<DropMenuListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.greyColor),
        ),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.isSelected = !widget.isSelected;
              });
            },
            child: ListTile(
              title: bodyText(widget.label),
              visualDensity: const VisualDensity(vertical: -4),
              trailing: bodyText(widget.quantity.toString()),
            ),
          ),
          !widget.isSelected
              ? Container()
              : Container(
                  margin: EdgeInsets.only(bottom: 20.h),
                  height: 190.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return itemVerticalCard(
                        title: "Product $index",
                        price: 12.50,
                        buttonLabel: "Select",
                        width: 220.w,
                        imageHeight: 120.h,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                        ),
                        buttonIcon: AssetImage("assets/plus_order.png"),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
