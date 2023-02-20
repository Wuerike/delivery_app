// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/domain/usecases/auth/user_data/user_auth_data_usercase.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class ValidateUserUsecaseAbstraction {
  Future<Result<bool, Failure>> execute({required String idToken});
}

class ValidateUserUsecase extends ValidateUserUsecaseAbstraction {
  // Dependencies
  final UserAuthDataUsercaseAbstraction userAuthDateUsecase;

  ValidateUserUsecase({
    UserAuthDataUsercaseAbstraction? userAuthDateUsecase,
  }) : userAuthDateUsecase = userAuthDateUsecase ?? UserAuthDataUsercase();

  @override
  Future<Result<bool, Failure>> execute({required String idToken}) async {
    return userAuthDateUsecase.execute(idToken: idToken).then(
      (result) {
        switch (result.status) {
          case ResultStatus.success:
            return Result.success(true);
          // TODO: Review this to separate real errors (failure()) from user not found at firebase (success(false))
          case ResultStatus.error:
            return Result.success(false);
        }
      },
    );
  }
}
