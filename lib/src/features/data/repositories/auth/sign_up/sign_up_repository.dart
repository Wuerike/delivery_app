import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_up/sign_up_body.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/models/sign_up_model.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

class SignUpRepository extends SignUpRepositoryAbstraction {
  final SignUpServiceAbstraction _signUpService;

  SignUpRepository({required SignUpServiceAbstraction signUpService}) : _signUpService = signUpService;

  @override
  Future<Result<SignUpModel, Failure>> signUp({required SignUpBody params}) async {
    try {
      final result = await _signUpService.signUp(body: params.toMap());
      var mapResult = SignUpModel.fromMap(result);
      return Result.success(mapResult);
    } on Failure catch (f) {
      return Result.failure(Failure.getFirebaseAuthErrorMessage(error: f.error));
    }
  }
}
