import '../../core/core.dart';

abstract class SessionRepositoryContract {
  Future<Result<bool>> signUp(String email, String password);
  Future<Result<bool>> signInWithGoogle();
}
