import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent));

    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 50.h,
                child: backButton(context, Colors.white),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                top: 330.h,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.h),
                    child: Center(
                      child: Column(
                        children: [
                          headerText("Welcome Back"),
                          SizedBox(height: 10.h),
                          bodyText("Login to your account", color: AppColors.greyColor),
                          SizedBox(height: 40.h),
                          _emailInput(),
                          SizedBox(height: 20.h),
                          _passwordInput(),
                          SizedBox(height: 40.h),
                          _loginButton(context),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed("forgot-password");
                            },
                            child: Container(
                              child: bodyText("Forgot your password?"),
                            ),
                          ),
                          SizedBox(height: 40.h),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed("sign-up"),
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  bodyText("Don't have an account?", color: AppColors.greyColor),
                                  bodyText(" "),
                                  bodyText("Sign up", color: AppColors.orange),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _emailInput() {
  return Container(
    height: 45.h,
    padding: EdgeInsets.only(left: 20.w),
    decoration: BoxDecoration(
      color: AppColors.bgInputs,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: TextField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 15.sp),
      decoration: InputDecoration(
        hintText: "Email",
        contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget _passwordInput() {
  return Container(
    height: 45.h,
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    decoration: BoxDecoration(
      color: AppColors.bgInputs,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Container(
      child: TextField(
        obscureText: true,
        style: TextStyle(fontSize: 15.sp),
        decoration: InputDecoration(
          hintText: "Password",
          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ),
  );
}

Widget _loginButton(BuildContext context) {
  return Container(
    width: 350.w,
    height: 45.h,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Text(
        "Log in",
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
