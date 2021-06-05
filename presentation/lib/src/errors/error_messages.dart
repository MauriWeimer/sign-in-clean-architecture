import 'package:domain/domain.dart';

final messages = <Object, String>{
  Error.network: 'Network error',
  Error.googleSignInFailed: 'Sign in with Google failed',
  Error.emptyField: 'This field is required',
  Error.invalidEmailFormat: 'Email format address format',
  Error.minimum8Characters: 'Minimum 8 characters',
  Error.passwordsNotMatch: 'Passwords do not match',
  Error.unknown: 'Unknown error',
};

extension ErrorExtension on Error {
  String get message => messages[this] ?? messages[Error.unknown]!;
}
