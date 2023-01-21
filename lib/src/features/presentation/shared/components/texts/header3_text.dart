import 'package:delivery_app/src/features/presentation/shared/components/texts/utils/outline_text_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget header3Text(
  String text, {
  double? fontSize,
  Color color = Colors.black,
  Color? strokeColor,
  TextAlign textAlign = TextAlign.start,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize ?? 17.sp,
      shadows: strokeColor == null ? [] : outlinedTextShadow(strokeColor: strokeColor),
    ),
  );
}
