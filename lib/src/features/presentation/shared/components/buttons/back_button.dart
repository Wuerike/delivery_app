import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget backButton(BuildContext context, Color color) {
  return IconButton(
    constraints: const BoxConstraints(),
    padding: EdgeInsets.zero,
    icon: Icon(
      Icons.arrow_back,
      color: color,
      size: 30.sp,
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
