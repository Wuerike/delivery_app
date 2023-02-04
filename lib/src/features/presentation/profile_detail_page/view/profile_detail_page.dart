import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header3_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileDetailPage extends StatelessWidget {
  const ProfileDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      child: SafeArea(
        child: Scaffold(
          appBar: _appBar(context),
          body: _profileBody(context),
          bottomNavigationBar: _saveButton(),
        ),
      ),
    );
  }
}

AppBar _appBar(BuildContext context) {
  return AppBar(
    elevation: 0.5,
    toolbarHeight: 150.h,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    titleSpacing: 20.w,
    title: Center(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
            ),
            radius: 50.r,
          ),
          Container(
            height: 100.r,
            width: 100.r,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 1.5),
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Icon(
              Icons.add_a_photo_rounded,
              color: Colors.white,
              size: 30.sp,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _profileBody(context) {
  return CustomScrollView(
    slivers: [
      SliverPadding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            [
              _inputField(context, labelText: "Username", keyboardType: TextInputType.text),
              _inputField(context, labelText: "Email", keyboardType: TextInputType.emailAddress),
              _inputField(context, labelText: "Phone", keyboardType: TextInputType.phone),
              _inputField(context, labelText: "Date of Birth", keyboardType: TextInputType.datetime),
              _inputField(context, labelText: "Delivery Address", keyboardType: TextInputType.text, maxLines: 3),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget _inputField(context,
    {String? labelText, TextInputType? keyboardType, int maxLines = 1, bool hasBottomBorder = true}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    ),
  );
}

Widget _saveButton() {
  return Container(
    height: 55.h,
    width: 300.w,
    margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
    decoration: BoxDecoration(
      color: AppColors.orange,
      borderRadius: BorderRadius.circular(10.r),
    ),
    child: Center(child: header3Text("Save", color: Colors.white)),
  );
}
