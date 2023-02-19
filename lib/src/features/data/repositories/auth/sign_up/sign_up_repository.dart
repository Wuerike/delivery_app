import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_up/sign_up_params.dart';
import 'package:delivery_app/src/features/domain/entities/auth/sign_up_entity.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/services/sign_up_service.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

class SignUpRepository extends SignUpRepositoryAbstraction {
  final SignUpServiceAbstraction signUpService;

  SignUpRepository({SignUpServiceAbstraction? signUpService}) : signUpService = signUpService ?? SignUpService();

  @override
  Future<Result<SignUpEntity, Failure>> signUp({required SignUpParams? params}) async {
    try {
      final result = await signUpService.signUp(body: params!.toMap());
      var mapResult = SignUpEntity.fromMap(result);
      return Result.success(mapResult);
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
