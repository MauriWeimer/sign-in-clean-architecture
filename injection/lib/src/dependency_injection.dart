import 'package:domain/domain.dart';
import 'package:get_it/get_it.dart';
import 'package:infrastructure/infrastructure.dart';

part 'infrastructure_dependency.dart';
part 'domain_dependency.dart';

final _instance = GetIt.instance;

class Injector {
  static void configureDependencies() async {
    _configureDataSources();
    _configureRepositories();
    _configureUseCases();
  }

  static T getInstance<T extends Object>() => _instance.get<T>();
}
