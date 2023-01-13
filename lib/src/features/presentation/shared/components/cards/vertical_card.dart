import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget verticalCard({
  ImageProvider<Object>? image,
  double? imageHeight,
  double? imageWidth,
  double? cardHorizontalMargin,
  Widget? child,
}) {
  return Container(
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
            width: imageWidth ?? double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        child ?? Container()
      ],
    ),
  );
}
