import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_theme/ui_theme.dart';

class PlatformApp extends PlatformWidget<CupertinoApp, MaterialApp> {
  const PlatformApp({
    required this.navigatorKey,
    required this.title,
    required this.onGenerateRoute,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Route<dynamic>? Function(RouteSettings) onGenerateRoute;
  final String title;

  @override
  MaterialApp buildAndroidWidget(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: CustomTheme.material,
      themeMode: ThemeMode.light,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
    );
  }

  @override
  CupertinoApp buildIosWidget(BuildContext context) {
    return CupertinoApp(
      title: title,
      theme: CustomTheme.cupertino,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
