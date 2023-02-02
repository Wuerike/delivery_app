import 'package:delivery_app/src/features/presentation/shared/components/texts/utils/outline_text_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bodyText(
  String text, {
  double? fontSize,
  Color color = Colors.black,
  Color? strokeColor,
  TextAlign textAlign = TextAlign.start,
  FontWeight fontWeight = FontWeight.w400,
  TextOverflow? overflow,
  int? maxLines,
}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: overflow,
    maxLines: maxLines,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize ?? 15.sp,
      shadows: strokeColor == null ? [] : outlinedTextShadow(strokeColor: strokeColor),
    ),
  );
}
