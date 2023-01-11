import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

Widget sectionHeader(String mainText, String actionText, {Function? onActionTap, IconData? icon}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      titleText(mainText),
      GestureDetector(
        child: icon == null ? bodyText(actionText, color: AppColors.orange) : _iconAndText(actionText, icon),
        onTap: () => onActionTap,
      ),
    ],
  );
}

Widget _iconAndText(String actionText, IconData icon) {
  return Row(
    children: [
      bodyText(actionText, color: AppColors.orange),
      Icon(
        icon,
        size: 15.sp,
        color: AppColors.orange,
      )
    ],
  );
}
