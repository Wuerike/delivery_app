import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:delivery_app/src/features/domain/entities/auth/user_auth_data_entity.dart';

class UserAuthDataRepository extends UserAuthDataRepositoryAbstraction {
  final UserAuthDataServiceAbstraction _userAuthDataService;

  UserAuthDataRepository({required UserAuthDataServiceAbstraction userAuthDataService})
      : _userAuthDataService = userAuthDataService;

  @override
  Future<Result<UserAuthDataEntity, Failure>> getData({required String idToken}) async {
    try {
      return _userAuthDataService.getData(idToken: idToken).then(
        (result) {
          return Result.success(UserAuthDataEntity.fromJson(result));
        },
      );
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
