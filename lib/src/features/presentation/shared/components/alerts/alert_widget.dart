import 'package:delivery_app/src/features/presentation/shared/components/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header2_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future alertWidget({
  required BuildContext context,
  required ImageProvider image,
  required String title,
  required String body,
  required String buttonLabel,
  required Function() onButtonPressed,
  bool? barrierDismissible,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: barrierDismissible == true,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.r),
          ),
        ),
        content: SizedBox(
          height: 300.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: image,
                width: 130.w,
                height: 130.h,
              ),
              header2Text(title, textAlign: TextAlign.center),
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
