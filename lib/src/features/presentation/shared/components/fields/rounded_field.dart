import 'package:delivery_app/src/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget roundedField(
  String hintText, {
  double? height,
  double? width,
  Color? color,
  bool obscureText = false,
  TextInputType? textInputType = TextInputType.text,
}) {
  height = height ?? 45.h;
  width = width ?? double.maxFinite;
  color = color ?? AppColors.bgInputs;

  return Container(
    height: height,
    width: width,
    padding: EdgeInsets.only(left: 20.w),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(height),
    ),
    child: TextField(
      keyboardType: textInputType,
      style: TextStyle(fontSize: 15.sp),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
