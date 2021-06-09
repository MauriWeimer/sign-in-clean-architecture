import '../error/error.dart';
import '../extensions/string_extension.dart';

abstract class Rule<T, E> {
  E? validate(T value);
}

class EmptyRule implements Rule<String, Error> {
  const EmptyRule();

  @override
  Error? validate(String value) => (value.isEmpty) ? Error.emptyField : null;
}

class EmailFormatRule implements Rule<String, Error> {
  const EmailFormatRule();

  @override
  Error? validate(String value) => (!value.isValidEmailFormat) ? Error.invalidEmailFormat : null;
}

class RepeatedPasswordRule implements Rule<String, Error> {
  const RepeatedPasswordRule(this.repeated);

  final String? repeated;

  @override
  Error? validate(String value) =>
      (this.repeated != null) && (value != this.repeated) ? Error.passwordsNotMatch : null;
}
