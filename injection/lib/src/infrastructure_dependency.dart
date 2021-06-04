part of 'dependency_injection.dart';

void _configureDataSources() {
  _instance.registerLazySingleton<SessionDataSourceContract>(
    () => FirebaseSessionDataSource(),
  );
}

void _configureRepositories() {
  _instance.registerLazySingleton<SessionRepositoryContract>(
    () => SessionRepository(
      _instance.get<SessionDataSourceContract>(),
    ),
  );
}
