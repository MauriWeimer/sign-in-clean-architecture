part of 'dependency_injection.dart';

void _configureUseCases() {
  _instance.registerLazySingleton<SignUp>(
    () => SignUp(_instance.get<SessionRepositoryContract>()),
  );
  _instance.registerLazySingleton<SignInWithGoogle>(
    () => SignInWithGoogle(_instance.get<SessionRepositoryContract>()),
  );
}
