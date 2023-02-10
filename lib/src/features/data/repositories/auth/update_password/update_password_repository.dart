import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

class UpdatePasswordRepository extends UpdatePasswordRepositoryAbstraction {
  final UpdatePasswordServiceAbstraction _updatePasswordService;

  UpdatePasswordRepository({required UpdatePasswordServiceAbstraction updatePasswordService})
      : _updatePasswordService = updatePasswordService;

  @override
  Future<Result<String, Failure>> updatePassword({required String email}) async {
    try {
      return _updatePasswordService.updatePassword(email: email).then(
        (result) {
          return Result.success(result["email"].toString());
        },
      );
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
