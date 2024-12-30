import 'package:client_type_safe_route_test/router/route_path.dart';
import 'package:client_type_safe_route_test/router/router_builder.dart';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(
      initialExtra: ref,
      initialLocation: '/${RoutePath.login}',
      routes: $appRoutes,
    );
  }
}
