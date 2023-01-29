import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header2_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget collectionCard({
  String? category,
  int? quantity,
  double? width,
  double? height,
  ImageProvider<Object>? image,
  Function()? onTap,
}) {
  height = height ?? double.maxFinite;
  width = width ?? double.maxFinite;

  return GestureDetector(
    onTap: onTap,
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.r),
          child: Image(
            fit: BoxFit.cover,
            image: image!,
            height: height,
            width: width,
          ),
        ),
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(0, 0, 0, 1.5),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(flex: 3),
              header2Text("$category", color: Colors.white),
              bodyText("$quantity Places", color: Colors.white),
              const Spacer(flex: 1)
            ],
          ),
        ),
      ],
    ),
  );
}
