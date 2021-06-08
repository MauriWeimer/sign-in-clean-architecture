import '../../core/core.dart';

class Email extends Validator<Error> {
  const Email({this.value = '', Error? error}) : super(error);

  final String value;

  @override
  Email? validate() {
    if (this.value.isEmpty)
      return this.copyWith(error: Error.emptyField);
    else if (!this.value.isValidEmailFormat) return this.copyWith(error: Error.invalidEmailFormat);

    return null;
  }

  Email? copyWith({String? value, Error? error}) => Email(
        value: value ?? this.value,
        error: error,
      );
}
