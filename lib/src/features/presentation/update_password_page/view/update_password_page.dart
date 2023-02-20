import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/features/presentation/update_password_page/view_model/update_password_view_model.dart';
import 'package:delivery_app/src/features/presentation/shared/components/alerts/alert_widget.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/fields/custom_text_form_field.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UpdatePasswordPage extends StatelessWidget with BaseView {
  // const PpdatePasswordPage({Key? key}) : super(key: key);
  final UpdatePasswordViewModelAbstraction viewModel;

  UpdatePasswordPage({
    super.key,
    UpdatePasswordViewModelAbstraction? viewModel,
  }) : viewModel = viewModel ?? UpdatePasswordViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: SizedBox(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(16, 50.h, 0, 0),
                  child: backButton(context, Colors.black),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 100.h, 0, 0),
                  padding: EdgeInsets.all(20.h),
                  child: Center(
                    child: Form(
                      key: viewModel.formKey,
                      autovalidateMode: AutovalidateMode.disabled,
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
                          CustomTextFormField(
                            hintText: "Email",
                            delegate: viewModel,
                            textInputType: CustomTextFormFieldType.email,
                          ),
                          SizedBox(height: 40.h),
                          roundedButton(
                            "Send",
                            onPressed: () => _sendEmailButtonPressed(context),
                          ),
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

extension UserAction on UpdatePasswordPage {
  _sendEmailButtonPressed(BuildContext context) async {
    if (viewModel.isFormValidate()) {
      await viewModel.updatePassword();
      alertWidget(
        context: context,
        image: const AssetImage("assets/lock.png"),
        title: "Update your password",
        body: "You'll shortly receive an email with a code to setup a new password.",
        buttonLabel: "Done",
        onButtonPressed: () => Navigator.popUntil(context, ModalRoute.withName("sign-in")),
      );
    }
  }
}
