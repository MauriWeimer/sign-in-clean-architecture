import '../../core/core.dart';
import '../repositories/session_repository.dart';

class SignIn {
  const SignIn(this._sessionRepository);

  final SessionRepositoryContract _sessionRepository;

  Future<Result<bool>> execute(String email, String password) =>
      _sessionRepository.signIn(email, password);
}
