abstract class StringValidator {
  bool isValid(String value);

}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

abstract class NumValidator {
  bool isValid2(int value);
}


class NonEmptyNumValidator implements NumValidator {
  @override
  bool isValid2(int value) {
    return value.isNaN;
  }
}

class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = 'Email can\'t be empty';
  final String invalidPasswordErrorText = 'Password can\'t be empty';
}

class PhoneValidators {
  final NumValidator phoneValidator = NonEmptyNumValidator();
  final String invalidPhoneErrorText = 'Number can\'t be empty';
}