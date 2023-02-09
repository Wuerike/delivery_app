abstract class AppFailureMessages {
  static String unexpectedErrorMessage = "An unexpected error has occurred";
}

abstract class FirebaseFailureMessages {
  static String emailNotFound =
      "There is no user record corresponding to this identifier. The user may have been deleted.";
  static String invalidPassword = "The password is invalid or the user does not have a password.";
  static String emailExist = "La dirección de correo electrónico ya está siendo utilizada por otra cuenta.";
  static String tooManyAttempts =
      "Hemos bloqueado todas las solicitudes de este dispositivo debido a una actividad inusual. Vuelve a intentarlo más tarde.";
  static String invalidIdToken =
      "La credencial del usuario ya no es válida. El usuario debe iniciar sesión nuevamente.";
  static String userNotFound =
      "No hay ningún registro de usuario que corresponda a este identificador. Es posible que se haya eliminado al usuario.";
}
