import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/constants/local_storage_keys.dart';
import 'package:delivery_app/src/features/domain/usecases/local_storage/local_storage_usecase.dart';
import 'package:delivery_app/src/services/firebase_services/google_sign_in_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/google_sign_in_service/services/google_sign_in_service.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class SignOutUsecaseAbstraction {
  Future<Result<bool, Failure>> execute();
}

class SignOutUsecase extends SignOutUsecaseAbstraction {
  // Dependencies
  final LocalStorageUsecaseAbstraction localStorageUsecase;
  final GoogleSignInServiceAbstraction googleSignInService;

  SignOutUsecase({
    LocalStorageUsecaseAbstraction? localStorageUsecase,
    GoogleSignInServiceAbstraction? googleSignInService,
  })  : localStorageUsecase = localStorageUsecase ?? LocalStorageUsecase(),
        googleSignInService = googleSignInService ?? GoogleSignInService();

  @override
  Future<Result<bool, Failure>> execute() async {
    await googleSignInService.signOut();
    return localStorageUsecase.executeRemove(key: LocalStorageKeys.idToken);
  }
}
