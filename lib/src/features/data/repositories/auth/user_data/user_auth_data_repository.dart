import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/services/user_auth_data_service.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:delivery_app/src/features/domain/entities/auth/user_auth_data_entity.dart';

class UserAuthDataRepository extends UserAuthDataRepositoryAbstraction {
  final UserAuthDataServiceAbstraction userAuthDataService;

  UserAuthDataRepository({UserAuthDataServiceAbstraction? userAuthDataService})
      : userAuthDataService = userAuthDataService ?? UserAuthDataService();

  @override
  Future<Result<UserAuthDataEntity, Failure>> getData({required String idToken}) async {
    try {
      return userAuthDataService.getData(idToken: idToken).then(
        (result) {
          return Result.success(UserAuthDataEntity.fromJson(result));
        },
      );
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
