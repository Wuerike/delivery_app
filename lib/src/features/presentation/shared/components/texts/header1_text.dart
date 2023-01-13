import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget header1Text(String text, {double fontSize = 0, Color color = Colors.black}) {
  fontSize = fontSize == 0 ? 30.sp : fontSize;

  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    ),
  );
}
