import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_sample/extra_model.dart';
import 'package:go_router_sample/extra_screen.dart';
import 'package:go_router_sample/main.dart';
import 'package:go_router_sample/path_parameter_screen.dart';
import 'package:go_router_sample/query_parameter_screen.dart';

part 'router.g.dart';

final appRouter = GoRouter(routes: $appRoutes);

@TypedGoRoute<MyHomePageRoute>(
  path: "/",
  routes: [
    TypedGoRoute<QueryParameterRoute>(path: "query_parameter"),
    TypedGoRoute<PathParameterRoute>(path: "path_parameter"),
    TypedGoRoute<ExtraRoute>(path: "extra"),
  ],
)
class MyHomePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) => const MyHomePage(title: "画面遷移サンプル");
}

class QueryParameterRoute extends GoRouteData {
  final String? param1;
  final String? param2;

  const QueryParameterRoute({
    this.param1,
    this.param2,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) => QueryParameterScreen(param1, param2);
}

class PathParameterRoute extends GoRouteData {
  final int id;

  const PathParameterRoute(
    this.id,
  );

  @override
  Widget build(BuildContext context, GoRouterState state) => PathParameterScreen(id);
}

class ExtraRoute extends GoRouteData {
  final ExtraModel? $extra;

  const ExtraRoute({
    this.$extra,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) => ExtraScreen($extra?.id, $extra?.name, $extra?.transitionDate);
}
