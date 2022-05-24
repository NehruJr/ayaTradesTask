class Validator {
  Validator();

  String? email(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return "Enter valid Email";
    } else {
      return null;
    }
  }

  String? password(String? value) {
    String pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return "Enter valid Password";
    } else {
      return null;
    }
  }
}
