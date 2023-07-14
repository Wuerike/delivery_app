import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/services/firebase_services/google_sign_in_service/models/user_model.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';

abstract class GoogleSignInServiceAbstraction {
  Future<UserModel> signIn();
  Future<Result<bool, Failure>> isUserInDatabase({required String userId});
}
