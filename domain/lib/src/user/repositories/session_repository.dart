import '../../core/core.dart';

abstract class SessionRepositoryContract {
  Future<Result<bool>> signInWithGoogle();
}
