import '../../core/core.dart';
import '../repositories/session_repository.dart';
import '../valueobjects/email.dart';
import '../valueobjects/password.dart';

class SignUp {
  const SignUp(this._sessionRepository);

  final SessionRepositoryContract _sessionRepository;

  Future<Result<bool>> execute(Email email, Password password) =>
      _sessionRepository.signUp(email.value, password.value);
}
