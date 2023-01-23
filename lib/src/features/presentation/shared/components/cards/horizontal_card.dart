import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header3_text.dart';
import 'package:delivery_app/src/features/presentation/shared/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget horizontalCard({
  String? title,
  String? body,
  String? stars,
  String? ratings,
  bool? isFavourite,
  void Function()? favouriteAction,
  ImageProvider<Object>? image,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.h),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(70.r),
          child: Image(
            width: 70.h,
            height: 70.h,
            fit: BoxFit.cover,
            image: image!,
          ),
        ),
        SizedBox(width: 10.w),
        Flexible(
          child: SizedBox(
            height: 60.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title == null ? Container() : header3Text(title.ellipsisOverflowFix(), overflow: TextOverflow.ellipsis),
                body == null ? Container() : bodyText(body.ellipsisOverflowFix(), color: AppColors.greyColor),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.yellow,
                      size: 15.sp,
                    ),
                    bodyText(" "),
                    bodyText(stars ?? ""),
                    bodyText(" "),
                    bodyText("(${ratings ?? ""} ratings)", color: AppColors.greyColor),
                  ],
                ),
              ],
            ),
          ),
        ),
        isFavourite == null
            ? Container()
            : Container(
                height: 70.h,
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: favouriteAction,
                  child: Icon(
                    Icons.bookmark_border,
                    color: isFavourite == true ? AppColors.orange : AppColors.greyColor,
                  ),
                ),
              )
      ],
    ),
  );
}
