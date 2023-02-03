import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyOrderView extends StatelessWidget {
  const EmptyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            child: Image(
              fit: BoxFit.cover,
              image: const AssetImage("assets/emptyOrder.png"),
              height: 250.r,
              width: 250.r,
            ),
          ),
          SizedBox(height: 100.h),
          header1Text("Empty Order", color: AppColors.greyColor),
          SizedBox(height: 20.h),
          bodyText(
            "Good food is always cooking! Go ahead, order some yummy items from the menu",
            color: AppColors.greyColor,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
