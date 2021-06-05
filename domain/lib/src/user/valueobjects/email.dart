import '../../core/core.dart';

class Email extends Validator<Error> {
  const Email({required this.value});
  const Email.pure({this.value = ''}) : super(true);

  final String value;

  @override
  Error? validate() {
    if (this.value.isEmpty)
      return Error.emptyField;
    else if (!this.value.isValidEmailFormat) return Error.invalidEmailFormat;

    return null;
  }
}
