import '../../core/core.dart';

class Password extends Validator<String, Error> {
  const Password({String value = '', this.repeated, Error? error}) : super(value, error);

  final String? repeated;

  Password copyWith({
    String? value,
    String? repeated,
    Error? error,
  }) =>
      Password(
        value: value ?? this.value,
        repeated: repeated ?? this.repeated,
        error: error ?? this.error,
      );

  @override
  Password validate() => copyWith(error: checkRules());

  @override
  List<Rule<String, Error>> get rules => [
        const EmptyRule(),
        RepeatedPasswordRule(this.repeated),
      ];
}
