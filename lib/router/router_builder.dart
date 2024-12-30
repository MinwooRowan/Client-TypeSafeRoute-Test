import 'package:client_type_safe_route_test/di/get_it_configuration.dart';
import 'package:client_type_safe_route_test/presentation/home/home_screen.dart';
import 'package:client_type_safe_route_test/presentation/home/view_model/home_view_model.dart';
import 'package:client_type_safe_route_test/presentation/login/login_screen.dart';
import 'package:client_type_safe_route_test/presentation/login/view_model/login_view_model.dart';
import 'package:client_type_safe_route_test/router/route_path.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

part 'router_builder.g.dart';

@TypedGoRoute<LoginRoute>(path: '/${RoutePath.login}', routes: [])
class LoginRoute extends GoRouteData {
  final LoginViewModel viewModel = getIt<LoginViewModel>();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LoginScreen(viewModel: viewModel);
  }
}

@TypedGoRoute<HomeRoute>(path: '/${RoutePath.home}', routes: [])
class HomeRoute extends GoRouteData {
  final HomeViewModel viewModel = getIt<HomeViewModel>();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return HomeScreen(viewModel: viewModel);
  }
}