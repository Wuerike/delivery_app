import 'package:delivery_app/src/features/presentation/shared/components/alerts/alert_widget.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/fields/rounded_field.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
          child: SizedBox(
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
                  child: Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Center(
                      child: Column(
                        children: [
                          header1Text("Forgot password"),
                          SizedBox(height: 10.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: bodyText(
                              "Please enter your email address. You will receive a link to create a new password via email.",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 40.h),
                          roundedField("Email", textInputType: TextInputType.emailAddress),
                          SizedBox(height: 40.h),
                          _sendButton(context),
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

Widget _sendButton(BuildContext context) {
  return roundedButton(
    "Send",
    onPressed: () {
      alertWidget(
        context,
        const AssetImage("assets/lock.png"),
        "Your password has been reset",
        "You'll shortly receive an email with a code to setup a new password.",
        "Done",
        () => Navigator.popUntil(context, ModalRoute.withName("login")),
      );
    },
  );
}
