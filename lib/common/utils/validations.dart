/// Validates the email format.
///
/// Returns true if the email is valid, otherwise returns an error message.
dynamic emailValidation({required String email}) {
  const pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regExp = RegExp(pattern);
  if (email.isEmpty) {
    return "Please enter your email.";
  } else if (email.length < 5) {
    return "Email should be above 5 characters";
  } else if (!regExp.hasMatch(email)) {
    return "Please enter a valid email address";
  }
  return true;
}

/// Validates the structure of a password.
///
/// Returns true if the password meets the required structure, otherwise returns an error message.
bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

/// Validates the password length.
///
/// Returns true if the password meets the length requirement, otherwise returns an error message.
dynamic passwordValidation({required String password}) {
  if (password.isEmpty) {
    return "Please enter your password.";
  } else if (password.length < 12) {
    return "Password can't be less than 12 characters";
  }
  return true;
}
