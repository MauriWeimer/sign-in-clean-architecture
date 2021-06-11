import 'package:domain/domain.dart';

final messages = <Object, String>{
  Error.network: 'Network error',
  Error.weakPassword: 'Password is weak',
  Error.emailAlreadyInUse: 'Email already in use',
  Error.userNotFound: 'User not found',
  Error.wrongPassword: 'Wrong password',
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
