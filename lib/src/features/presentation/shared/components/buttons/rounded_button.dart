import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget roundedButton(
  String label, {
  double? height,
  double? width,
  Color? color,
  Color? labelColor,
  ImageProvider<Object>? iconImagePath,
  Function()? onPressed,
}) {
  height = height ?? 45.h;
  width = width ?? double.maxFinite;
  color = color ?? AppColors.orange;
  labelColor = labelColor ?? Colors.white;
  onPressed = onPressed ?? () {};

  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: iconImagePath == null
            ? bodyText(label, color: labelColor)
            : _iconAndText(label, labelColor, iconImagePath)),
  );
}

Widget _iconAndText(String label, Color labelColor, ImageProvider<Object> iconImagePath) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image(
        image: iconImagePath,
        width: 20.sp,
        height: 20.sp,
      ),
      bodyText("  "),
      Container(
        child: bodyText(label, color: labelColor),
      ),
    ],
  );
}
