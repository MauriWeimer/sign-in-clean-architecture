abstract class Validator<E> {
  const Validator([this.pure = false]);

  final bool pure;

  E? get error => (pure) ? null : validate();
  bool get isValid => validate() == null;

  E? validate();
}
