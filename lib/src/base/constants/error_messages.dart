abstract class AppFailureMessages {
  static String unexpectedErrorMessage = "An unexpected error has occurred";
}

abstract class FirebaseFailureMessages {
  static String emailNotFound =
      "There is no user record corresponding to this identifier. The user may have been deleted.";
  static String invalidPassword = "The password is invalid or the user does not have a password.";
  static String emailExist = "The email address is already in use by another account.";
  static String tooManyAttempts =
      "We have blocked all requests for this device due to unusual activity. Try again later.";
  static String invalidIdToken = "The user's credential is no longer valid. The user must log in again.";
  static String userNotFound =
      "There is no user record corresponding to this identifier. The user may have been removed.";
}
