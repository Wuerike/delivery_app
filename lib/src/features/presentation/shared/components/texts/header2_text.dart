import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget header2Text(
  String text, {
  double fontSize = 0,
  Color color = Colors.black,
  TextAlign textAlign = TextAlign.start,
}) {
  fontSize = fontSize == 0 ? 20.sp : fontSize;

  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    ),
  );
}