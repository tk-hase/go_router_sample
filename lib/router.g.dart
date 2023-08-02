// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $myHomePageRoute,
    ];

RouteBase get $myHomePageRoute => GoRouteData.$route(
      path: '/',
      factory: $MyHomePageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'query_parameter',
          factory: $QueryParameterRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'path_parameter',
          factory: $PathParameterRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'extra',
          factory: $ExtraRouteExtension._fromState,
        ),
      ],
    );

extension $MyHomePageRouteExtension on MyHomePageRoute {
  static MyHomePageRoute _fromState(GoRouterState state) => MyHomePageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $QueryParameterRouteExtension on QueryParameterRoute {
  static QueryParameterRoute _fromState(GoRouterState state) =>
      QueryParameterRoute(
        param1: state.uri.queryParameters['param1'],
        param2: state.uri.queryParameters['param2'],
      );

  String get location => GoRouteData.$location(
        '/query_parameter',
        queryParams: {
          if (param1 != null) 'param1': param1,
          if (param2 != null) 'param2': param2,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PathParameterRouteExtension on PathParameterRoute {
  static PathParameterRoute _fromState(GoRouterState state) =>
      PathParameterRoute(
        int.parse(state.uri.queryParameters['id']!),
      );

  String get location => GoRouteData.$location(
        '/path_parameter',
        queryParams: {
          'id': id.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ExtraRouteExtension on ExtraRoute {
  static ExtraRoute _fromState(GoRouterState state) => ExtraRoute(
        $extra: state.extra as ExtraModel?,
      );

  String get location => GoRouteData.$location(
        '/extra',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}
