import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header3_text.dart';
import 'package:delivery_app/src/features/presentation/shared/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget itemVerticalCard({
  String? title,
  double? price,
  String? buttonLabel,
  double? width,
  double? imageHeight,
  ImageProvider<Object>? image,
  ImageProvider<Object>? buttonIcon,
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
          SizedBox(height: 10.h),
          Flexible(
            child: SizedBox(
              width: width ?? double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title == null ? Container() : _hasTitle(title),
                  price == null ? Container() : _hasPrice(price),
                  buttonLabel == null ? Container() : _hasButton(buttonLabel, buttonIcon),
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

Widget _hasPrice(double price) {
  return bodyText(
    "\$ ${price.toStringAsFixed(2)}",
    color: AppColors.greyColor,
  );
}

Widget _hasButton(String buttonLabel, ImageProvider<Object>? buttonIcon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: bodyText(
          buttonLabel,
          color: AppColors.orange,
          fontSize: 17.sp,
        ),
      ),
      buttonIcon == null
          ? Container()
          : Image(
              image: buttonIcon,
              width: 20.r,
              height: 20.r,
            ),
    ],
  );
}
