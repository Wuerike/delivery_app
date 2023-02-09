import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_in/sign_in_params.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_up/sign_up_params.dart';
import 'package:delivery_app/src/features/domain/entities/auth/sign_in_entity.dart';
import 'package:delivery_app/src/features/domain/entities/auth/sign_up_entity.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

// * Auth Repositories
abstract class SignUpRepositoryAbstraction {
  Future<Result<SignUpEntity, Failure>> signUp({required SignUpParams params});
}

abstract class SignInRepositoryAbstraction {
  Future<Result<SignInEntity, Failure>> signIn({required SignInParams params});
}

// * Database Repositories
abstract class SaveUserRepositoryAbstraction {
  Future<Result<UserEntity, Failure>> saveUser({required UserEntity user});
}
