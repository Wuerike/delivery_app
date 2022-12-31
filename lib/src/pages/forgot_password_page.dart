import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

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
                        "Forgot password",
                        style: TextStyle(
                          color: accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Text(
                          "Please enter your email address. You will receive a link to create a new password via email.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      _emailInput(),
                      SizedBox(height: 40.h),
                      _sendButton(context),
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

Widget _emailInput() {
  return Container(
    height: 45.h,
    padding: EdgeInsets.only(left: 20.w),
    decoration: BoxDecoration(
      color: bgInputs,
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

Widget _sendButton(BuildContext context) {
  return Container(
    height: 45.h,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Text(
        "Send",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
        ),
      ),
      onPressed: () {
        _showAlert(context);
      },
    ),
  );
}

void _showAlert(BuildContext context) {
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
                image: AssetImage("assets/lock.png"),
                width: 130.w,
                height: 130.h,
              ),
              Text(
                "Your password has been reset",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.sp,
                ),
              ),
              Text(
                "You'll shortly receive an email with a code to setup a new password.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: accentColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp,
                ),
              ),
              _doneButton(context)
            ],
          ),
        ),
      );
    },
  );
}

Widget _doneButton(BuildContext context) {
  return Container(
    height: 45.h,
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: orange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
      ),
      child: Text(
        "Done",
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
        ),
      ),
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName("login"));
      },
    ),
  );
}
