import '../../core/core.dart';

class Password extends Validator<Error> {
  const Password({required this.value, this.repeated});
  const Password.pure({this.value = '', this.repeated}) : super(true);

  final String value;
  final String? repeated;

  @override
  Error? validate() {
    if (this.value.isEmpty)
      return Error.emptyField;
    else if (this.value.length < 8)
      return Error.minimum8Characters;
    else if ((this.repeated != null) && (this.value != this.repeated))
      return Error.passwordsNotMatch;

    return null;
  }
}
