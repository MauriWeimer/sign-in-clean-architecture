import '../rules/rules.dart';

abstract class Validator<T, E> {
  const Validator(this.value, this.error);

  final T value;
  final E? error;

  E? checkRules() {
    for (var rule in this.rules) {
      final error = rule.validate(value);
      if (error != null) return error;
    }
  }

  bool get isValid => this.error == null;
  Validator<T, E> validate();

  List<Rule<T, E>> get rules;
}
