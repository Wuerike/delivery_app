// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/constants/local_storage_keys.dart';
import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/features/domain/usecases/auth/sign_up/sign_up_usecase.dart';
import 'package:delivery_app/src/features/domain/usecases/auth/sign_up/sign_up_usecase_params.dart';
import 'package:delivery_app/src/features/domain/usecases/local_storage/local_storage_usecase.dart';
import 'package:delivery_app/src/features/presentation/shared/components/fields/custom_text_form_field.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:delivery_app/src/features/presentation/sign_up_page/model/sign_up_form_fields.dart';
import 'package:delivery_app/src/features/presentation/sign_up_page/model/sing_up_model.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:flutter/material.dart';

abstract class SignUpViewModelInput {
  // Exposed Properties
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateController;
  late DateTime selectedDate;
  SignUpModel? signUpModel = SignUpModel();

  // Exposed Methods
  Future<Result<bool, Failure>> signUp();
  bool isFormValidate();
}

abstract class SignUpViewModelAbstraction extends SignUpViewModelInput with TextFormFieldDelegate, BaseViewModel {}

class SignUpViewModel extends SignUpViewModelAbstraction {
  // Dependencies
  final SignUpUsecaseAbstraction signUpUsecase;
  final LocalStorageUsecaseAbstraction localStorageUsecase;

  SignUpViewModel({
    SignUpUsecaseAbstraction? signUpUsecase,
    LocalStorageUsecaseAbstraction? localStorageUsecase,
  })  : signUpUsecase = signUpUsecase ?? SignUpUsecase(),
        localStorageUsecase = localStorageUsecase ?? LocalStorageUsecase();

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
    dateController = TextEditingController();
    selectedDate = DateTime.now();
  }

  @override
  Future<Result<bool, Failure>> signUp() async {
    loadingStatusState.setLoadingState(isLoading: true);

    return signUpUsecase
        .execute(
      params: SignUpUsecaseParams(
        username: signUpModel?.username ?? "",
        email: signUpModel?.email ?? "",
        password: signUpModel?.password ?? "",
        date: signUpModel?.date ?? "",
        phone: signUpModel?.phone ?? "",
      ),
    )
        .then((result) {
      switch (result.status) {
        case ResultStatus.success:
          localStorageUsecase.executeSave(
            key: LocalStorageKeys.idToken,
            value: result.value?.idToken ?? "",
          );
          loadingStatusState.setLoadingState(isLoading: false);
          return Result.success(true);
        case ResultStatus.error:
          loadingStatusState.setLoadingState(isLoading: false);
          return Result.failure(result.error);
      }
    });
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  onChanged({required String value, required String hintText}) {
    switch (hintText) {
      case SignUpFormFields.email:
        signUpModel?.email = value;
        break;
      case SignUpFormFields.password:
        signUpModel?.password = value;
        break;
      case SignUpFormFields.username:
        signUpModel?.username = value;
        break;
      case SignUpFormFields.phone:
        signUpModel?.phone = value;
        break;
      case SignUpFormFields.dateOfBirth:
        signUpModel?.date = value;
        break;
    }
  }
}
