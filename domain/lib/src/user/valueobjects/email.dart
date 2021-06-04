import '../../core/core.dart';

enum EmailError { empty, invalidFormat }

class Email extends Validator<EmailError> {
  const Email({required this.value});
  const Email.pure({this.value = ''}) : super(true);

  final String value;

  @override
  EmailError? validate() {
    if (this.value.isEmpty)
      return EmailError.empty;
    else if (!this.value.isValidEmailFormat) return EmailError.invalidFormat;

    return null;
  }
}
