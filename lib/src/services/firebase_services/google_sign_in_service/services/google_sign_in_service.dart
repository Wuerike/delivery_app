import 'package:delivery_app/src/base/app_error/app_error.dart';
import 'package:delivery_app/src/base/constants/error_messages.dart';
import 'package:delivery_app/src/features/data/interfaces/interfaces.dart';
import 'package:delivery_app/src/features/data/repositories/user/get_user_repository.dart';
import 'package:delivery_app/src/services/firebase_services/google_sign_in_service/interfaces/interfaces.dart';
import 'package:delivery_app/src/services/firebase_services/google_sign_in_service/models/user_model.dart';
import 'package:delivery_app/src/utils/result_type/result_type.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService extends GoogleSignInServiceAbstraction {
  final GetUserRepositoryAbstraction repository;

  GoogleSignInService({GetUserRepositoryAbstraction? repository}) : repository = repository ?? GetUserRepository();

  @override
  Future<Result<bool, Failure>> isUserInDatabase({required String userId}) {
    return repository.getUser(userId: userId).then((result) {
      switch (result.status) {
        case ResultStatus.success:
          return Result.success(true);
        case ResultStatus.error:
          if (result.error!.message == AppFailureMessages.documentNotFound) {
            return Result.success(false);
          }

          return Result.failure(result.error);
      }
    });
  }

  @override
  Future<UserModel> signIn() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

      // Maps UserCredential to UserModel and returns it
      return UserModel(userCredential.user, googleAuth?.idToken);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await GoogleSignIn().disconnect();
    } catch (e) {
      print(e);
    }
  }
}
