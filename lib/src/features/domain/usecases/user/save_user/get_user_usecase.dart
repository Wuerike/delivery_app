import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class GetUserUsecaseAbstraction {
  Future<Result<UserEntity, Failure>> execute({required String userId});
}

class GetUserUsecase extends GetUserUsecaseAbstraction {
  // * Dependencies
  final GetUserRepositoryAbstraction _repository;

  GetUserUsecase({required GetUserRepositoryAbstraction repository}) : _repository = repository;

  @override
  Future<Result<UserEntity, Failure>> execute({required String userId}) {
    return _repository.getUser(userId: userId).then((result) {
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
