import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/constants/error_messages.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/data/repositories/auth/user_data/user_auth_data_repository.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:delivery_app/src/features/domain/entities/auth/user_auth_data_entity.dart';

abstract class UserAuthDataUsercaseAbstraction {
  Future<Result<UserAuthDataEntity, Failure>> execute({required String idToken});
}

class UserAuthDataUsercase extends UserAuthDataUsercaseAbstraction {
  final UserAuthDataRepositoryAbstraction userAuthDataRepository;

  UserAuthDataUsercase({UserAuthDataRepositoryAbstraction? userAuthDataRepository})
      : userAuthDataRepository = userAuthDataRepository ?? UserAuthDataRepository();

  @override
  Future<Result<UserAuthDataEntity, Failure>> execute({required String idToken}) {
    return userAuthDataRepository.getData(idToken: idToken).then(
      (result) {
        switch (result.status) {
          case ResultStatus.success:
            // Null Check
            if (result.value == null) {
              return Result.failure(Failure.fromMessage(message: AppFailureMessages.unexpectedErrorMessage));
            }

            return Result.success(result.value);

          case ResultStatus.error:
            return Result.failure(result.error);
        }
      },
    );
  }
}
