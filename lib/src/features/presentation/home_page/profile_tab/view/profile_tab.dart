import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header2_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key? key}) : super(key: key);

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      child: SafeArea(
        child: Scaffold(
          appBar: _appBar(),
          body: _profileBody(),
        ),
      ),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    elevation: 0.5,
    toolbarHeight: 150.h,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.white,
    titleSpacing: 20.w,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
          ),
          radius: 50.r,
        ),
        header2Text("Amanda Silveira"),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.chevron_right, color: AppColors.greyColor, size: 25.sp),
        )
      ],
    ),
  );
}

Widget _profileBody() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
    child: Column(
      children: [
        Column(
          children: [
            _profileItem(AssetImage("assets/noti.png"), "Notifications", () {}),
            _profileItem(AssetImage("assets/payicon.png"), "Payment method", () {}),
            _profileItem(AssetImage("assets/rewardicon.png"), "Reward credits", () {}),
            _profileItem(AssetImage("assets/promoicon.png"), "My promo code", () {}),
          ],
        ),
        SizedBox(height: 20.h),
        Column(
          children: [
            _profileItem(AssetImage("assets/settingicon.png"), "Settings", () {}),
            _profileItem(AssetImage("assets/inviteicon.png"), "Invite friends", () {}),
            _profileItem(AssetImage("assets/helpicon.png"), "Help center", () {}),
            _profileItem(AssetImage("assets/abouticon.png"), "About us", () {}),
          ],
        )
      ],
    ),
  );
}

Widget _profileItem(ImageProvider<Object> image, String label, Function() onPressed) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    horizontalTitleGap: 0,
    visualDensity: const VisualDensity(vertical: -4),
    leading: Image(
      image: image,
      height: 30.h,
      width: 30.h,
    ),
    title: header2Text(label, fontWeight: FontWeight.w400),
    trailing: IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.chevron_right, color: AppColors.greyColor, size: 25.sp),
    ),
  );
}
