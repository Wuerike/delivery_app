// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/features/domain/usecases/auth/sign_out/sign_out_usecase.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:delivery_app/src/features/presentation/sign_up_page/model/sing_up_model.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class ProfileViewModelInput {
  // Exposed Properties
  late LoadingStateProvider loadingStatusState;
  SignUpModel? signUpModel = SignUpModel();

  // Exposed Methods
  Future<Result<bool, Failure>> signOut();
}

abstract class ProfileViewModelAbstraction extends ProfileViewModelInput with BaseViewModel {}

class ProfileViewModel extends ProfileViewModelAbstraction {
  // Dependencies
  final SignOutUsecaseAbstraction signOutUsecase;

  ProfileViewModel({
    SignOutUsecaseAbstraction? signOutUsecase,
  }) : signOutUsecase = signOutUsecase ?? SignOutUsecase();

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<Result<bool, Failure>> signOut() async {
    loadingStatusState.setLoadingState(isLoading: true);

    return signOutUsecase.execute().then(
      (result) {
        switch (result.status) {
          case ResultStatus.success:
            loadingStatusState.setLoadingState(isLoading: false);
            return Result.success(true);
          case ResultStatus.error:
            loadingStatusState.setLoadingState(isLoading: false);
            return Result.failure(result.error);
        }
      },
    );
  }
}
