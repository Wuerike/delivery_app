import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header3_text.dart';
import 'package:delivery_app/src/features/presentation/shared/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget placeVerticalCard({
  String? title,
  String? body,
  String? stars,
  String? ratings,
  double? width,
  double? textHeight,
  double? imageHeight,
  ImageProvider<Object>? image,
  double? cardHorizontalMargin,
  Function()? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: cardHorizontalMargin ?? 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image(
              image: image!,
              height: imageHeight ?? 220.h,
              width: width ?? double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          Flexible(
            child: SizedBox(
              height: textHeight ?? 70.h,
              width: width ?? double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title == null ? Container() : _hasTitle(title),
                  body == null ? Container() : _hasBody(body),
                  stars == null || ratings == null ? Container() : _hasReviews(stars, ratings),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _hasTitle(String title) {
  return header3Text(
    title.ellipsisOverflowFix(),
    overflow: TextOverflow.ellipsis,
  );
}

Widget _hasBody(String body) {
  return bodyText(
    body.ellipsisOverflowFix(),
    color: AppColors.greyColor,
    overflow: TextOverflow.ellipsis,
  );
}

Widget _hasReviews(String stars, String ratings) {
  return Row(
    children: [
      Icon(
        Icons.star,
        color: AppColors.yellow,
        size: 15.sp,
      ),
      bodyText(" "),
      bodyText(stars),
      bodyText(" "),
      bodyText("($ratings ratings)", color: AppColors.greyColor),
    ],
  );
}
