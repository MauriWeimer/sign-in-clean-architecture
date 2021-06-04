part of 'dependency_injection.dart';

void _configureUseCases() {
  _instance.registerLazySingleton<SignInWithGoogle>(
    () => SignInWithGoogle(_instance.get<SessionRepositoryContract>()),
  );
}
