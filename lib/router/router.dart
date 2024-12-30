import 'package:client_type_safe_route_test/router/route_path.dart';
import 'package:client_type_safe_route_test/router/router_builder.dart';

import 'package:go_router/go_router.dart';

GoRouter router() => GoRouter(
      initialLocation: '/${RoutePath.login}',
      routes: $appRoutes,
    );
