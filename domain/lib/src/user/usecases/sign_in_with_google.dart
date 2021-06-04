import '../../core/core.dart';
import '../repositories/session_repository.dart';

class SignInWithGoogle {
  const SignInWithGoogle(this._sessionRepository);

  final SessionRepositoryContract _sessionRepository;

  Future<Result<bool>> execute() => _sessionRepository.signInWithGoogle();
}
