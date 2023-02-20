import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/services/update_password_servide.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

class UpdatePasswordRepository extends UpdatePasswordRepositoryAbstraction {
  final UpdatePasswordServiceAbstraction updatePasswordService;

  UpdatePasswordRepository({UpdatePasswordServiceAbstraction? updatePasswordService})
      : updatePasswordService = updatePasswordService ?? UpdatePasswordService();

  @override
  Future<Result<String, Failure>> updatePassword({required String email}) async {
    try {
      final result = await updatePasswordService.updatePassword(email: email);
      return Result.success(result["email"].toString());
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
