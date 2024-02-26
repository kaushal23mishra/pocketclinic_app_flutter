dynamic emailValidation({required String email}) {
  const pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regExp = RegExp(pattern);
  if (email.isEmpty) {
    return "Please enter your email.";
  } else if (email.length < 5) {
    return "Email should be above 5";
  } else if (!regExp.hasMatch(email)) {
    return "Please enter a valid email address";
  }
  return true;
}



bool validateStructure(String value){
  String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp =  RegExp(pattern);
  return regExp.hasMatch(value);
}
dynamic passwordValidation({required String password}) {
  if (password.isEmpty) {
    return "Please enter your password.";
  } else if (password.length < 12) {
    return "Password can't be less then 12 words";
  }
  return true;
}
