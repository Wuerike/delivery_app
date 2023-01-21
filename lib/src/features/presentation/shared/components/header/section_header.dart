import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header2_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget sectionHeader({String title = "", String actionText = "", Function()? onActionTap, IconData? icon}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      header2Text(title),
      GestureDetector(
        onTap: onActionTap,
        child: icon == null ? bodyText(actionText, color: AppColors.orange) : _iconAndText(actionText, icon),
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
