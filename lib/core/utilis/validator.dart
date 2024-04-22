class MyValidation {
  String? nameValidate(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please Enter Your Name';
    }
    if (input.length < 4 || input.length > 15) {
      return 'invalid name';
    }
    return null;
  }
}
