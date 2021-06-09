import '../../core/core.dart';

class Email extends Validator<String, Error> {
  const Email({String value = '', Error? error}) : super(value, error);

  @override
  Email validate() => Email(value: this.value, error: checkRules());

  @override
  List<Rule<String, Error>> get rules => [const EmptyRule(), const EmailFormatRule()];
}
