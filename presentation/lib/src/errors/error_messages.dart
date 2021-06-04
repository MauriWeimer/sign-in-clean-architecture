import 'package:domain/domain.dart';

final messages = <Object, String>{
  Error.network: 'Network error',
  Error.googleSignInFailed: 'Sign in with Google failed',
  Error.unknown: 'Unknown error',
};

extension ErrorExtension on Error {
  String get message => messages[this] ?? messages[Error.unknown]!;
}
