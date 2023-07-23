import 'dart:ui';
import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:delivery_app/src/features/presentation/welcome_page/view_model/welcome_view_model.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  final WelcomeViewModelAbstraction viewModel;

  WelcomePage({
    super.key,
    WelcomeViewModelAbstraction? viewModel,
  }) : viewModel = viewModel ?? WelcomeViewModel();

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with BaseView {
  @override
  Widget build(BuildContext context) {
    widget.viewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));

    return widget.viewModel.loadingStatusState.isLoading
        ? loadingView
        : Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1502301103665-0b95cc738daf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                        ),
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: header1Text("DELIVERED FAST FOOD AT YOUR DOOR", fontSize: 45.sp, color: Colors.white),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                          child: bodyText("Set exact location to find the right restaurants near you",
                              color: Colors.white),
                        ),
                        roundedButton(
                          "Log in",
                          onPressed: () => Navigator.pushNamed(context, "sign-in"),
                        ),
                        SizedBox(height: 20.h),
                        roundedButton(
                          "Connect with Google",
                          color: Colors.white,
                          labelColor: Colors.black,
                          iconImagePath: const AssetImage("assets/google.png"),
                          onPressed: () => _signInWithGooglePressed(context),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
  }
}

// TODO: Maybe it could be at the view model
extension UserAction on _WelcomePageState {
  _signInWithGooglePressed(BuildContext context) {
    widget.viewModel.loadingStatusState.setLoadingState(isLoading: true);
    widget.viewModel.signInWithGoogle().then((result) {
      switch (result.status) {
        case ResultStatus.success:
          coordinator.showTabsPage(context: context);
          break;
        case ResultStatus.error:
          widget.viewModel.loadingStatusState.setLoadingState(isLoading: false);
          errorStateProvider.setFailure(context: context, value: result.error!);
          break;
      }
    });
  }
}
