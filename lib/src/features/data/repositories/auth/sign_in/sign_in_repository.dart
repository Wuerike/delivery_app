import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_in/sign_in_params.dart';
import 'package:delivery_app/src/features/domain/entities/auth/sign_in_entity.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

class SignInRepository extends SignInRepositoryAbstraction {
  final SignInServiceAbstraction _signInService;

  SignInRepository({required SignInServiceAbstraction signInService}) : _signInService = signInService;

  @override
  Future<Result<SignInEntity, Failure>> signIn({required SignInParams params}) async {
    try {
      final result = await _signInService.signIn(body: params.toMap());
      var mapResult = SignInEntity.fromMap(result);
      return Result.success(mapResult);
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
