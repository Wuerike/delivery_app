import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void alertWidget(
  BuildContext context,
  ImageProvider image,
  String title,
  String body,
  String buttonLabel,
  Function() onButtonPressed,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        content: Container(
          height: 300.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: image,
                width: 130.w,
                height: 130.h,
              ),
              titleText(title, textAlign: TextAlign.center),
              bodyText(body, textAlign: TextAlign.center),
              roundedButton(
                buttonLabel,
                onPressed: onButtonPressed,
              ),
            ],
          ),
        ),
      );
    },
  );
}
