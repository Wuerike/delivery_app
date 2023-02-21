import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/cards/place_horizontal_card.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header3_text.dart';
import 'package:delivery_app/src/features/presentation/shared/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderCard extends StatelessWidget {
  final int index;

  const OrderCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(210, 211, 215, 1.0),
            spreadRadius: 1.0,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          placeHorizontalCard(
            title: "Restaurante numero $index",
            body: "Restaurante endereço $index",
            ratings: "0",
            stars: "0",
            image: NetworkImage(
              "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
            ),
          ),
          Column(
            children: List.generate(3, (int index) {
              return _orderItems();
            }),
          ),
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.greyColor),
              ),
            ),
            child: header3Text("Add more items", color: AppColors.orange),
          ),
        ],
      ),
    );
  }
}

Widget _orderItems() {
  return Container(
    width: double.maxFinite,
    padding: EdgeInsets.symmetric(vertical: 10.h),
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(color: AppColors.greyColor),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: header3Text(
            "Item 123456789".ellipsisOverflowFix(),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 5.w),
        bodyText(
          "\$ 5.56".ellipsisOverflowFix(),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
