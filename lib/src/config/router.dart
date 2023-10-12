import 'package:find_coffee_app/src/config/route.dart';
import 'package:find_coffee_app/src/pages/onboarding/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

class Router {
  Router(this._navigatorKey);

  final GlobalKey<NavigatorState> _navigatorKey;

  Route<dynamic> generateRoute(RouteSettings settings) {
    final route = mapToRoute(settings)!;
    return route.asRoute();
  }

  CustomRoute? mapToRoute(RouteSettings settings) {
    CustomRoute? route;

    if (settings.arguments == null) {
      route = initialRoute;
    } else {
      route = settings.arguments as CustomRoute?;
    }

    return route;
  }

  CustomRoute get initialRoute {
    return OnboardingRoute();
  }

  Future pushTo(CustomRoute route, {bool shouldShowAsDialog = false}) {
    Fimber.d('Push to: $route');

    final pageRoute = route.asRoute(shouldShowAsDialog: shouldShowAsDialog);
    return _navigatorKey.currentState!.push(pageRoute);
  }

  Future replaceTo(CustomRoute route) {
    Fimber.d('Replace to: $route');

    return _navigatorKey.currentState!
        .pushAndRemoveUntil(route.asRoute(), (route) => false);
  }

  void pop<T extends Object>([T? result]) {
    _navigatorKey.currentState!.pop(result);
  }
}

class OnboardingRoute extends CustomRoute {
  @override
  Map<String, dynamic> get arguments => const {};

  @override
  String get name => 'ONBOARDING';

  @override
  Widget get page => const OnboardingPage();
}
