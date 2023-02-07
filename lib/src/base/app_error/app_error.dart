import 'dart:convert';

import 'package:delivery_app/src/base/constants/error_messages.dart';
import 'package:delivery_app/src/services/firebase_services/auth_service/models/auth_error_model.dart';

class Failure {
  String? message;
  Map<String, dynamic> error = {};

  Failure.fromMessage({String? message}) {
    this.message = message;
  }

  Failure.fromBody({required String body}) {
    var jsonData = jsonDecode(body);
    error = jsonData;
  }

  @override
  String toString() => message ?? "";

  static Failure getFirebaseAuthErrorMessage({required Map<String, dynamic> error}) {
    var mapedError = AuthErrorModel.fromMap(error);

    // TODO: Maybe change to get only the external error mapedError.error?.message
    var message = "";
    mapedError.error?.errors?.forEach((error) {
      message = error.message!;
    });

    if (message == "EMAIL_NOT_FOUND") {
      return Failure.fromMessage(message: FirebaseFailureMessages.emailNotFound);
    } else if (message == "INVALID_PASSWORD") {
      return Failure.fromMessage(message: FirebaseFailureMessages.invalidPassword);
    } else if (message == "EMAIL_EXISTS") {
      return Failure.fromMessage(message: FirebaseFailureMessages.emailExist);
    } else if (message == "TOO_MANY_ATTEMPTS_TRY_LATER") {
      return Failure.fromMessage(message: FirebaseFailureMessages.tooManyAttempts);
    } else if (message == "INVALID_ID_TOKEN") {
      return Failure.fromMessage(message: FirebaseFailureMessages.invalidIdToken);
    } else if (message == "USER_NOT_FOUND") {
      return Failure.fromMessage(message: FirebaseFailureMessages.userNotFound);
    } else {
      return Failure.fromMessage(message: message);
    }
  }
}
