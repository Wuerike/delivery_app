import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/constants/local_storage_keys.dart';
import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/features/domain/usecases/auth/sign_in/sign_in_usecase.dart';
import 'package:delivery_app/src/features/domain/usecases/local_storage/local_storage_usecase.dart';
import 'package:delivery_app/src/features/presentation/shared/components/fields/custom_text_form_field.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:delivery_app/src/features/presentation/sign_in_page/model/sign_in_form_fields.dart';
import 'package:delivery_app/src/features/presentation/sign_in_page/model/sign_in_model.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:flutter/material.dart';

abstract class SignInViewModelInput {
  // Exposed Properties
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SignInModel? signInModel = SignInModel();

  // Exposed Methods
  Future<Result<bool, Failure>> signIn();
  bool isFormValidate();
}

abstract class SignInViewModelAbstraction extends SignInViewModelInput with TextFormFieldDelegate, BaseViewModel {}

class SignInViewModel extends SignInViewModelAbstraction {
  // Dependencies
  final SignInUsecaseAbstraction signInUsecase;
  final LocalStorageUsecaseAbstraction localStorageUsecase;

  SignInViewModel({
    SignInUsecaseAbstraction? signInUsecase,
    LocalStorageUsecaseAbstraction? localStorageUsecase,
  })  : signInUsecase = signInUsecase ?? SignInUsecase(),
        localStorageUsecase = localStorageUsecase ?? LocalStorageUsecase();

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<Result<bool, Failure>> signIn() {
    loadingStatusState.setLoadingState(isLoading: true);

    return signInUsecase.execute(params: signInModel!.toSignInUsecaseParams()).then(
      (result) {
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
      },
    );
  }

  @override
  bool isFormValidate() {
    return formKey.currentState?.validate() ?? false;
  }

  @override
  onChanged({required String value, required String hintText}) {
    switch (hintText) {
      case SignInFormFields.email:
        signInModel?.email = value;
        break;
      case SignInFormFields.password:
        signInModel?.password = value;
        break;
    }
  }
}
