import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/constants/local_storage_keys.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/features/domain/usecases/local_storage/local_storage_usecase.dart';
import 'package:delivery_app/src/features/domain/usecases/user/save_user/save_user_usecase.dart';
// TODO: Fix these dependencies in layers other than domain
import 'package:delivery_app/src/services/firebase_services/google_sign_in_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/google_sign_in_service/services/google_sign_in_service.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class GoogleSignInUsecaseAbstraction {
  Future<Result<UserEntity, Failure>> execute();
}

class GoogleSignInUsecase extends GoogleSignInUsecaseAbstraction {
  // Dependencies
  final GoogleSignInServiceAbstraction googleSignInService;
  final SaveUserUsecaseAbstraction saveUserUsecase;
  final LocalStorageUsecaseAbstraction localStorageUsecase;

  GoogleSignInUsecase({
    GoogleSignInServiceAbstraction? googleSignInService,
    SaveUserUsecaseAbstraction? saveUserUsecase,
    LocalStorageUsecaseAbstraction? localStorageUsecase,
  })  : googleSignInService = googleSignInService ?? GoogleSignInService(),
        saveUserUsecase = saveUserUsecase ?? SaveUserUsecase(),
        localStorageUsecase = localStorageUsecase ?? LocalStorageUsecase();

  @override
  Future<Result<UserEntity, Failure>> execute() async {
    final googleUser = await googleSignInService.signIn();

    // TODO: Retrieve the result and look for success/failure
    localStorageUsecase.executeSave(
      key: LocalStorageKeys.idToken,
      value: googleUser.idToken ?? "",
    );

    // TODO: Don't think this method should exist in this service
    return googleSignInService.isUserInDatabase(userId: googleUser.uid ?? "").then((result) {
      switch (result.status) {
        case ResultStatus.success:
          // If user in database returns it
          if (result.value!) {
            return Result.success(googleUser.toUserEntity());
          }
          // Save user and returns it
          return saveUserUsecase.execute(user: googleUser.toUserEntity());
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
