import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_theme/ui_theme.dart';

class PlatformApp extends PlatformWidget<CupertinoApp, MaterialApp> {
  const PlatformApp({
    required this.navigatorKey,
    required this.title,
    required this.onGenerateRoute,
    required this.supportedLocales,
    this.locale,
    this.localizationsDelegates,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Route<dynamic>? Function(RouteSettings) onGenerateRoute;
  final String title;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;

  @override
  MaterialApp buildAndroidWidget(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: CustomTheme.material,
      themeMode: ThemeMode.light,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }

  @override
  CupertinoApp buildIosWidget(BuildContext context) {
    return CupertinoApp(
      title: title,
      theme: CustomTheme.cupertino,
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
    );
  }
}
