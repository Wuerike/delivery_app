import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/back_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/buttons/rounded_button.dart';
import 'package:delivery_app/src/features/presentation/shared/components/fields/custom_text_form_field.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/body_text.dart';
import 'package:delivery_app/src/features/presentation/shared/components/texts/header1_text.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:delivery_app/src/features/presentation/sign_up_page/model/sign_up_form_fields.dart';
import 'package:delivery_app/src/features/presentation/sign_up_page/view_model/sign_up_view_model.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SingUpPage extends StatelessWidget with BaseView {
  final SignUpViewModelAbstraction viewModel;

  SingUpPage({
    super.key,
    SignUpViewModelAbstraction? viewModel,
  }) : viewModel = viewModel ?? SignUpViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.initState(loadingState: Provider.of<LoadingStateProvider>(context));

    return viewModel.loadingStatusState.isLoading
        ? loadingView
        : Scaffold(
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
                        child: Padding(
                          padding: EdgeInsets.all(20.h),
                          child: Center(
                            child: Form(
                              key: viewModel.formKey,
                              autovalidateMode: AutovalidateMode.disabled,
                              child: Column(
                                children: [
                                  header1Text("Create an account"),
                                  SizedBox(height: 40.h),
                                  CustomTextFormField(
                                    hintText: SignUpFormFields.username,
                                    delegate: viewModel,
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomTextFormField(
                                    hintText: SignUpFormFields.email,
                                    textInputType: CustomTextFormFieldType.email,
                                    delegate: viewModel,
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomTextFormField(
                                    hintText: SignUpFormFields.phone,
                                    textInputType: CustomTextFormFieldType.phone,
                                    delegate: viewModel,
                                  ),
                                  SizedBox(height: 10.h),
                                  GestureDetector(
                                    onTap: () => _selectDate(context),
                                    child: AbsorbPointer(
                                      child: CustomTextFormField(
                                        hintText: SignUpFormFields.dateOfBirth,
                                        textInputType: CustomTextFormFieldType.date,
                                        delegate: viewModel,
                                        controller: viewModel.dateController,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  CustomTextFormField(
                                    hintText: SignUpFormFields.password,
                                    textInputType: CustomTextFormFieldType.password,
                                    delegate: viewModel,
                                  ),
                                  SizedBox(height: 40.h),
                                  roundedButton(
                                    "Log in",
                                    onPressed: () => _loginButtonPressed(context),
                                  ),
                                  SizedBox(height: 40.h),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: bodyText(
                                      "By clicking Sign up you agree to the following Therms and Conditions without reservation.",
                                      textAlign: TextAlign.center,
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
                ),
              ),
            ),
          );
  }
}

extension UserAction on SingUpPage {
  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDate,
      firstDate: DateTime(1960, 1),
      lastDate: viewModel.selectedDate,
      locale: const Locale('en', ''),
    );

    if (picked != null && picked != viewModel.selectedDate) {
      // TODO: Check this direct SignUpModel access from SignUpPage
      viewModel.signUpModel?.date = "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
      viewModel.dateController.text = "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
    }
  }

  _loginButtonPressed(BuildContext context) {
    if (viewModel.isFormValidate()) {
      viewModel.signUp().then(
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
