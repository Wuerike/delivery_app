import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget horizontalCard({ImageProvider<Object>? image, Widget? child}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    height: 120.h,
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image(
            width: 80.w,
            height: 100.h,
            fit: BoxFit.cover,
            image: image!,
          ),
        ),
        SizedBox(width: 10.w),
        child ?? Container(),
      ],
    ),
  );
}
