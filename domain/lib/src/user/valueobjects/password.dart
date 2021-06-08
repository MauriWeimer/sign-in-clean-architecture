import '../../core/core.dart';

class Password extends Validator<Error> {
  const Password({this.value = '', this.repeated, Error? error}) : super(error);

  final String value;
  final String? repeated;

  @override
  Password? validate() {
    if (this.value.isEmpty)
      return this.copyWith(error: Error.emptyField);
    else if (this.value.length < 8)
      return this.copyWith(error: Error.minimum8Characters);
    else if ((this.repeated != null) && (this.value != this.repeated))
      return this.copyWith(error: Error.passwordsNotMatch);

    return null;
  }

  Password copyWith({String? value, String? repeated, Error? error}) => Password(
        value: value ?? this.value,
        repeated: repeated ?? this.repeated,
        error: error,
      );
}
