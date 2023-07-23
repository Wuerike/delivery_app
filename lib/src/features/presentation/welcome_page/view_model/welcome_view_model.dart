import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/views/base_view.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/features/domain/usecases/auth/google_sign_in/google_sign_in_usecase.dart';
import 'package:delivery_app/src/features/presentation/shared/state_providers/loading_state_provider.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class WelcomeViewModelInput {
  // Exposed Methods
  Future<Result<UserEntity, Failure>> signInWithGoogle();
}

abstract class WelcomeViewModelAbstraction extends WelcomeViewModelInput with BaseViewModel {}

class WelcomeViewModel extends WelcomeViewModelAbstraction {
  final GoogleSignInUsecaseAbstraction googleSignInUsecase;

  WelcomeViewModel({GoogleSignInUsecaseAbstraction? googleSignInUsecase})
      : googleSignInUsecase = googleSignInUsecase ?? GoogleSignInUsecase();

  @override
  void initState({required LoadingStateProvider loadingState}) {
    loadingStatusState = loadingState;
  }

  @override
  Future<Result<UserEntity, Failure>> signInWithGoogle() {
    return googleSignInUsecase.execute();
  }
}
