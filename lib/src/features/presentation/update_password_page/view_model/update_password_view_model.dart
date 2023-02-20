import 'package:delivery_app/src/features/domain/usecases/auth/update_password/update_password_usecase.dart';
import 'package:delivery_app/src/features/presentation/shared/components/fields/custom_text_form_field.dart';
import 'package:flutter/material.dart';

abstract class UpdatePasswordViewModelInput {
  // Exposed Properties
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String userEmail;

  // Exposed Methods
  Future<void> updatePassword();
  bool isFormValidate();
}

abstract class UpdatePasswordViewModelAbstraction extends UpdatePasswordViewModelInput with TextFormFieldDelegate {}

class UpdatePasswordViewModel extends UpdatePasswordViewModelAbstraction {
  // Dependencies
  final UpdatePasswordUsecaseAbstraction updatePasswordUsecase;

  UpdatePasswordViewModel({UpdatePasswordUsecaseAbstraction? updatePasswordUsecase})
      : updatePasswordUsecase = updatePasswordUsecase ?? UpdatePasswordUsecase();

  @override
  Future<void> updatePassword() async {
    await updatePasswordUsecase.execute(email: userEmail);
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  onChanged({required String value, required String hintText}) {
    userEmail = value;
  }
}
