abstract class StringValidation {
  bool isValid(String value);
}

class NonEmptyStringValidator implements StringValidation {
  @override
  bool isValid(String value) {
    return value.isEmpty;
  }
}

class EmailAndPasswordValidator {
  final StringValidation emailValidate = NonEmptyStringValidator();
  final StringValidation passwordValidate = NonEmptyStringValidator();
  final String invalidEmailErrorText = 'Email can\'t be empty';
  final String invalidPasswordErrorText = 'Password can\'t be empty';
}
