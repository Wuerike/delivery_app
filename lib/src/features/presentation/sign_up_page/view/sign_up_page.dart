import 'package:delivery_app/src/features/presentation/shared/components/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/fields/rounded_field.dart';
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
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 50.h,
                  child: backButton(context, Colors.black),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 100.h,
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.all(20.h),
                      child: Center(
                        child: Column(
                          children: [
                            header1Text("Create an account"),
                            SizedBox(height: 40.h),
                            roundedField("Username"),
                            SizedBox(height: 10.h),
                            roundedField("Email", textInputType: TextInputType.emailAddress),
                            SizedBox(height: 10.h),
                            roundedField("Phone", textInputType: TextInputType.phone),
                            SizedBox(height: 10.h),
                            roundedField("Date of birth", textInputType: TextInputType.datetime),
                            SizedBox(height: 10.h),
                            roundedField("Password", obscureText: true),
                            SizedBox(height: 40.h),
                            _sign_up_button(context),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _sign_up_button(BuildContext context) {
  return roundedButton(
    "Log in",
    onPressed: () => Navigator.of(context).pushNamed("tabs"),
  );
}
