import 'package:delivery_app/src/features/presentation/shared/components/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/fields/custom_text_form_field.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  left: 16,
                  top: 50.h,
                  child: backButton(context, Colors.black),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 100.h,
                  child: Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Center(
                      child: Column(
                        children: [
                          header1Text("Create an account"),
                          SizedBox(height: 40.h),
                          CustomTextFormField(hintText: "Username"),
                          SizedBox(height: 10.h),
                          CustomTextFormField(hintText: "Email", textInputType: CustomTextFormFieldType.email),
                          SizedBox(height: 10.h),
                          CustomTextFormField(hintText: "Phone", textInputType: CustomTextFormFieldType.phone),
                          SizedBox(height: 10.h),
                          CustomTextFormField(hintText: "Date of birth", textInputType: CustomTextFormFieldType.date),
                          SizedBox(height: 10.h),
                          CustomTextFormField(hintText: "Password", textInputType: CustomTextFormFieldType.password),
                          SizedBox(height: 40.h),
                          _signUpButton(context),
                          SizedBox(height: 40.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: bodyText(
                              "By clicking Sign up you agree to the following Therms and Conditions without reservation.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _signUpButton(BuildContext context) {
  return roundedButton(
    "Log in",
    onPressed: () => Navigator.pushNamed(context, "home"),
  );
}
