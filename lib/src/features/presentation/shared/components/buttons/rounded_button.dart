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
  width = width ?? double.infinity;
  color = color ?? AppColors.orange;
  labelColor = labelColor ?? Colors.white;
  onPressed = onPressed ?? () {};

  if (iconImagePath == null) {
    return _roundedButtonWithoutIcon(label, height, width, color, labelColor, onPressed);
  }

  return _roundedButtonWithIcon(label, height, width, color, labelColor, iconImagePath, onPressed);
}

Widget _roundedButtonWithoutIcon(
  String label,
  double height,
  double width,
  Color color,
  Color labelColor,
  Function() onPressed,
) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: bodyText(label, color: labelColor),
    ),
  );
}

Widget _roundedButtonWithIcon(
  String label,
  double height,
  double width,
  Color color,
  Color labelColor,
  ImageProvider<Object> iconImagePath,
  Function()? onPressed,
) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
      child: Row(
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
      ),
    ),
  );
}
