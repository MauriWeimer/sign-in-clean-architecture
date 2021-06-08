abstract class Validator<E> {
  const Validator(this.error);

  final E? error;

  bool get isValid => error == null;
  Validator<E>? validate();
}
