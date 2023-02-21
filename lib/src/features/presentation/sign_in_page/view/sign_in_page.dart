import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/colors/colors.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/fields/custom_text_form_field.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:delivery_app/src/features/presentation/sign_in_page/model/sign_in_form_fields.dart';
import 'package:delivery_app/src/features/presentation/sign_in_page/view_model/sign_in_view_model.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget with BaseView {
  final SignInViewModelAbstraction viewModel;

  SignInPage({
    super.key,
    SignInViewModelAbstraction? viewModel,
  }) : viewModel = viewModel ?? SignInViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));

    return viewModel.loadingStatusState.isLoading
        ? loadingView
        : Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Container(
                          width: double.maxFinite,
                          height: 350.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 330.h, 0, 0),
                        padding: EdgeInsets.all(20.h),
                        decoration: BoxDecoration(
                          color: AppColors.bgGreyPage,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Center(
                          child: Form(
                            key: viewModel.formKey,
                            autovalidateMode: AutovalidateMode.disabled,
                            child: Column(
                              children: [
                                header1Text("Welcome Back"),
                                SizedBox(height: 10.h),
                                bodyText("Login to your account", color: AppColors.greyColor),
                                SizedBox(height: 40.h),
                                CustomTextFormField(
                                  hintText: SignInFormFields.email,
                                  textInputType: CustomTextFormFieldType.email,
                                  delegate: viewModel,
                                ),
                                SizedBox(height: 20.h),
                                CustomTextFormField(
                                  hintText: SignInFormFields.password,
                                  textInputType: CustomTextFormFieldType.password,
                                  delegate: viewModel,
                                ),
                                SizedBox(height: 40.h),
                                roundedButton(
                                  "Log in",
                                  onPressed: () => _loginButtonPressed(context),
                                ),
                                SizedBox(height: 20.h),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, "update-password");
                                  },
                                  child: Container(
                                    child: bodyText("Forgot your password?"),
                                  ),
                                ),
                                SizedBox(height: 40.h),
                                GestureDetector(
                                  onTap: () => Navigator.pushNamed(context, "sign-up"),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      bodyText("Don't have an account?", color: AppColors.greyColor),
                                      bodyText(" "),
                                      bodyText("Sign up", color: AppColors.orange),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}

extension UserAction on SignInPage {
  _loginButtonPressed(BuildContext context) {
    if (viewModel.isFormValidate()) {
      viewModel.signIn().then(
        (result) {
          switch (result.status) {
            case ResultStatus.success:
              Navigator.pushNamed(context, "home");
              break;
            case ResultStatus.error:
              errorStateProvider.setFailure(context: context, value: result.error!);
              break;
          }
        },
      );
    }
  }
}
