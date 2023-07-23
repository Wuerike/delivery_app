import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/home_page/tabs/profile_tab/view_model/profile_view_model.dart';
import 'package:delivery_app/src/features/presentation/shared/components/alerts/alert_widget.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header2_text.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  final ProfileViewModelAbstraction viewModel;

  ProfileTab({
    super.key,
    ProfileViewModelAbstraction? viewModel,
  }) : viewModel = viewModel ?? ProfileViewModel();

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> with BaseView {
  @override
  Widget build(BuildContext context) {
    widget.viewModel.initState(
      loadingState: Provider.of<LoadingStateProvider>(context),
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white),
      child: SafeArea(
        child: Scaffold(
          appBar: _appBar(context),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  Column(
                    children: [
                      _profileItem(const AssetImage("assets/noti.png"), "Notifications", () {}),
                      _profileItem(const AssetImage("assets/payicon.png"), "Payment method", () {}),
                      _profileItem(const AssetImage("assets/rewardicon.png"), "Reward credits", () {}),
                      _profileItem(const AssetImage("assets/promoicon.png"), "My promo code", () {}),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    children: [
                      _profileItem(const AssetImage("assets/settingicon.png"), "Settings", () {}),
                      _profileItem(const AssetImage("assets/inviteicon.png"), "Invite friends", () {}),
                      _profileItem(const AssetImage("assets/helpicon.png"), "Help center", () {}),
                      _profileItem(const AssetImage("assets/abouticon.png"), "About us", () {}),
                      _profileItem(
                          const AssetImage("assets/logout.png"), "Logout", () => _signOutButtonPressed(context)),
                    ],
                  )
                ],
              ),
            ),
          ),
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
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundImage: const NetworkImage(
            "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
          ),
          radius: 50.r,
        ),
        header2Text("Amanda Silveira"),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, "profile-detail"),
          icon: Icon(Icons.chevron_right, color: AppColors.greyColor, size: 25.sp),
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

// ignore: library_private_types_in_public_api
extension UserAction on _ProfileTabState {
  _signOutButtonPressed(
    BuildContext context,
  ) async {
    await alertWidget(
      context: context,
      image: const AssetImage("assets/logout.png"),
      title: "Sing Out",
      body: "Do you wish close your section? Tap out of this alert to dismiss it.",
      buttonLabel: "Close Section",
      barrierDismissible: true,
      onButtonPressed: () {
        widget.viewModel.signOut();
        Navigator.pushNamedAndRemoveUntil(context, "welcome", (Route<dynamic> route) => false);
      },
    );
  }
}
