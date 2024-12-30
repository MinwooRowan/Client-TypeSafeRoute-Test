import 'package:client_type_safe_route_test/di/get_it_configuration.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() {
  getIt.init();
}
