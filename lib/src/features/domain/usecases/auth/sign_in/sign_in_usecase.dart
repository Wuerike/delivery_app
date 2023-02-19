import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/constants/error_messages.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_in/sign_in_params.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_in/sign_in_repository.dart';
import 'package:delivery_app/src/features/domain/entities/auth/sign_in_entity.dart';
import 'package:delivery_app/src/features/domain/usecases/auth/sign_in/sign_in_usecase_params.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class SignInUsecaseAbstraction {
  Future<Result<SignInEntity, Failure>> execute({required SignInUsecaseParams params});
}

class SignInUsecase extends SignInUsecaseAbstraction {
  final SignInRepositoryAbstraction signInRepository;

  SignInUsecase({
    SignInRepositoryAbstraction? signInRepository,
  }) : signInRepository = signInRepository ?? SignInRepository();

  @override
  Future<Result<SignInEntity, Failure>> execute({required SignInUsecaseParams params}) {
    return signInRepository.signIn(params: SignInParams(email: params.email, password: params.password)).then(
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
