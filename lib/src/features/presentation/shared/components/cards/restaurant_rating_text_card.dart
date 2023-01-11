import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget restaurantRatingTextCard({String? title, String? body, String? stars, String? ratings, double? height}) {
  return SizedBox(
    height: height ?? 80.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null ? Container() : titleText(title),
        body == null ? Container() : bodyText(body, color: AppColors.greyColor),
        Row(
          children: [
            Icon(
              Icons.star,
              color: AppColors.yellow,
              size: 15.sp,
            ),
            bodyText(" "),
            bodyText("${stars}"),
            bodyText(" "),
            bodyText("(${ratings} ratings)", color: AppColors.greyColor),
          ],
        ),
      ],
    ),
  );
}

/*

 */