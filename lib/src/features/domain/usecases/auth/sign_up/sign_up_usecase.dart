import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/constants/error_messages.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_up/sign_up_params.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_up/sign_up_repository.dart';
import 'package:delivery_app/src/features/domain/entities/auth/sign_up_entity.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/features/domain/usecases/auth/sign_up/sign_up_usecase_params.dart';
import 'package:delivery_app/src/features/domain/usecases/user/save_user/save_user_usecase.dart';
import 'package:delivery_app/src/utils/date/datetime_now_string_helper.dart';
import 'package:delivery_app/src/utils/default_images/default_user_photo.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class SignUpUsecaseAbstraction {
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUsecaseParams params});
}

class SignUpUsecase extends SignUpUsecaseAbstraction {
  final SignUpRepositoryAbstraction signUpRepository;
  final SaveUserUsecaseAbstraction saveUserUsecase;

  SignUpUsecase({
    SignUpRepositoryAbstraction? signUpRepository,
    SaveUserUsecaseAbstraction? saveUserUsecase,
  })  : signUpRepository = signUpRepository ?? SignUpRepository(),
        saveUserUsecase = saveUserUsecase ?? SaveUserUsecase();

  @override
  Future<Result<SignUpEntity, Failure>> execute({required SignUpUsecaseParams params}) {
    return signUpRepository.signUp(params: SignUpParams(email: params.email, password: params.password)).then(
      (result) {
        switch (result.status) {
          case ResultStatus.success:
            // Null Check
            if (result.value == null) {
              return Result.failure(Failure.fromMessage(message: AppFailureMessages.unexpectedErrorMessage));
            }

            var signUpEntity = result.value!;

            var userEntity = UserEntity(
              userId: signUpEntity.localId,
              role: UserRole.user.value(),
              username: params.username,
              email: signUpEntity.email,
              phone: params.phone,
              dateOfBirth: params.date,
              startDate: DateTimeNowStringHelper.getDate(),
              photo: DefaultUserPhotoHelper.defaultUserPhoto,
              shippingAddress: '',
              billingAddress: '',
              idToken: signUpEntity.idToken,
            );

            return saveUserUsecase.execute(user: userEntity).then((result) {
              switch (result.status) {
                case ResultStatus.success:
                  return Result.success(signUpEntity);
                case ResultStatus.error:
                  return Result.failure(result.error);
              }
            });

          case ResultStatus.error:
            return Result.failure(result.error);
        }
      },
    );
  }
}
