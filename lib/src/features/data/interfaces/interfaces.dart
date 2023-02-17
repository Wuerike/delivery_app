import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_in/sign_in_params.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_up/sign_up_params.dart';
import 'package:delivery_app/src/features/domain/entities/auth/sign_in_entity.dart';
import 'package:delivery_app/src/features/domain/entities/auth/sign_up_entity.dart';
import 'package:delivery_app/src/features/domain/entities/auth/user_auth_data_entity.dart';
import 'package:delivery_app/src/features/domain/entities/user/user_entity.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

// * Auth Repositories
abstract class SignUpRepositoryAbstraction {
  Future<Result<SignUpEntity, Failure>> signUp({required SignUpParams params});
}

abstract class SignInRepositoryAbstraction {
  Future<Result<SignInEntity, Failure>> signIn({required SignInParams params});
}

abstract class UpdatePasswordRepositoryAbstraction {
  Future<Result<String, Failure>> updatePassword({required String email});
}

abstract class UserAuthDataRepositoryAbstraction {
  Future<Result<UserAuthDataEntity, Failure>> getData({required String idToken});
}

// * Database Repositories
abstract class SaveUserRepositoryAbstraction {
  Future<Result<UserEntity, Failure>> saveUser({required UserEntity user});
}

abstract class GetUserRepositoryAbstraction {
  Future<Result<UserEntity, Failure>> getUser({required String userId});
}

// * Local Storage
abstract class LocalStorageRepositoryAbstraction {
  Future<Result<bool, Failure>> save({required String key, required String value});
  Future<Result<String, Failure>> get({required String key});
  Future<Result<bool, Failure>> remove({required String key});
}
