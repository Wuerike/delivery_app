import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bodyText(String text, {double fontSize = 0, Color color = Colors.black, TextAlign textAlign = TextAlign.start}) {
  fontSize = fontSize == 0 ? 15.sp : fontSize;

  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
    ),
  );
}
