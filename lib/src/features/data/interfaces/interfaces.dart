import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_in/sign_in_body.dart';
import 'package:delivery_app/src/features/data/repositories/auth/sign_up/sign_up_body.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/models/sign_in_model.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/models/sign_up_model.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class SignUpRepositoryAbstraction {
  Future<Result<SignUpModel, Failure>> signUp({required SignUpBody params});
}

abstract class SignInRepositoryAbstraction {
  Future<Result<SignInModel, Failure>> signIn({required SignInBody params});
}
