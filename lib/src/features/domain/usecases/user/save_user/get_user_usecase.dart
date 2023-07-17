import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/data/repositories/user/get_user_repository.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class GetUserUsecaseAbstraction {
  Future<Result<UserEntity, Failure>> execute({required String userId});
}

class GetUserUsecase extends GetUserUsecaseAbstraction {
  // * Dependencies
  final GetUserRepositoryAbstraction repository;

  GetUserUsecase({GetUserRepositoryAbstraction? repository}) : repository = repository ?? GetUserRepository();

  @override
  Future<Result<UserEntity, Failure>> execute({required String userId}) async {
    return await repository.getUser(userId: userId);
  }
}
