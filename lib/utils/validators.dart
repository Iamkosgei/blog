String isEmailValid(String em) {
  if (em.isEmpty) {
    return 'Please enter an email';
  }
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);
  if (!regExp.hasMatch(em)) {
    return 'Enter a valid email';
  }

  return null;
}

String validPassword(String pass) {
  if (pass.isEmpty) {
    return 'Please enter an email';
  }
  return null;
}
