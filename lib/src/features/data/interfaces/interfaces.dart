import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

// * Auth Repositories
abstract class SignUpRepositoryAbstraction {
  Future<Result<SignUpModel, Failure>> signUp({required SignUpBody params});
}

abstract class SignInRepositoryAbstraction {
// * Database Repositories
abstract class SaveUserRepositoryAbstraction {
  Future<Result<UserEntity, Failure>> saveUser({required UserEntity user});
}
