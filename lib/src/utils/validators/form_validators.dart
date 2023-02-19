class EmailFormValidator {
  static String message = 'Not a valid email';
  static String? validateEmail({required String email}) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(email) ? null : message;
  }
}

class PasswordFormValidator {
  static String message = 'Should have at least 6 characters';
  static String? validatePassword({required String password}) {
    return password.isNotEmpty && password.length >= 6 ? null : message;
  }
}

class DefaultFormValidator {
  static String message = 'Can not be empty';
  static String? validateIsNotEmpty({required String value}) {
    return value.isNotEmpty ? null : message;
  }
}
