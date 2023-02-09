import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class SaveUserUsecaseAbstraction {
  Future<Result<UserEntity, Failure>> execute({required UserEntity user});
}

class SaveUserUsecase extends SaveUserUsecaseAbstraction {
  // * Dependencies
  final SaveUserRepositoryAbstraction _repository;

  SaveUserUsecase({required SaveUserRepositoryAbstraction repository}) : _repository = repository;

  @override
  Future<Result<UserEntity, Failure>> execute({required UserEntity user}) {
    return _repository.saveUser(user: user).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          var entity = UserEntity.fromMap(result.value!.toMap());
          return Result.success(entity);
        case ResultStatus.error:
          return Result.failure(result.error);
      }
    });
  }
}
