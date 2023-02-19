// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/utils/validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextFormFieldDelegate {
  onChanged({required String value, required String hintText});
}

enum CustomTextFormFieldType { text, email, password, phone, date }

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  late double height;
  late double width;
  late Color color;
  late CustomTextFormFieldType textInputType;
  late TextFormFieldDelegate? delegate;
  late TextEditingController? controller;

  CustomTextFormField({
    required this.hintText,
    this.delegate,
    this.controller,
    Key? key,
    double? height,
    double? width,
    Color? color,
    CustomTextFormFieldType? textInputType,
  }) : super(key: key) {
    this.height = height ?? 45.h;
    this.width = width ?? double.maxFinite;
    this.color = color ?? AppColors.bgInputs;
    this.textInputType = textInputType ?? CustomTextFormFieldType.text;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(height),
          ),
        ),
        Container(
          height: height + 15.h,
          padding: EdgeInsets.only(left: 20.w),
          child: TextFormField(
            controller: controller,
            keyboardType: getKeyboardType(textInputType: textInputType),
            style: TextStyle(fontSize: 15.sp),
            obscureText: textInputType == CustomTextFormFieldType.password,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              errorStyle: TextStyle(
                fontSize: 12.h,
                height: 0,
              ),
            ),
            onChanged: (value) {
              if (delegate != null) {
                delegate!.onChanged(value: value, hintText: hintText);
              }
            },
            validator: (value) {
              switch (textInputType) {
                case CustomTextFormFieldType.email:
                  return EmailFormValidator.validateEmail(email: value ?? '');
                case CustomTextFormFieldType.password:
                  return PasswordFormValidator.validatePassword(password: value ?? '');
                default:
                  return DefaultFormValidator.validateIsNotEmpty(value: value ?? '');
              }
            },
          ),
        ),
      ],
    );
  }

  TextInputType? getKeyboardType({required CustomTextFormFieldType textInputType}) {
    switch (textInputType) {
      case CustomTextFormFieldType.email:
        return TextInputType.emailAddress;
      case CustomTextFormFieldType.password:
        return TextInputType.visiblePassword;
      case CustomTextFormFieldType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }
}
