import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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
                      Text(
                        "Create an account",
                        style: TextStyle(
                          color: AppColors.accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      _input("Username"),
                      SizedBox(height: 10.h),
                      _input("Email", textInputType: TextInputType.emailAddress),
                      SizedBox(height: 10.h),
                      _input("Phone", textInputType: TextInputType.phone),
                      SizedBox(height: 10.h),
                      _input("Date of birth", textInputType: TextInputType.datetime),
                      SizedBox(height: 10.h),
                      _input("Password", obscureText: true),
                      SizedBox(height: 40.h),
                      _sign_up_button(context),
                      SizedBox(height: 40.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "By clicking Sign up you agree to the following Therms and Conditions without reservation.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
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
    );
  }
}

Widget _input(String hintText, {bool obscureText = false, TextInputType textInputType = TextInputType.text}) {
  return Container(
    height: 45.h,
    padding: EdgeInsets.only(left: 20.w),
    decoration: BoxDecoration(
      color: AppColors.bgInputs,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: TextField(
      keyboardType: textInputType,
      style: TextStyle(fontSize: 15.sp),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget _sign_up_button(BuildContext context) {
  return Container(
    height: 45.h,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Text(
        "Sign up",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed("tabs");
      },
    ),
  );
}
