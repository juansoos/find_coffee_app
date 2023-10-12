import 'dart:async';

import 'package:find_coffee_app/src/common/di/modules_config.dart';
import 'package:find_coffee_app/src/config/configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CustomColors.brown,
    ));

    final navigatorKey = GlobalKey<NavigatorState>();
    runApp(MyApp(navigatorKey: navigatorKey));
  }, (error, stack) {
    Fimber.e('Not handled error $error, stacktrace $stack');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.navigatorKey});

  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Coffee',
      theme: CustomTheme.light,
      themeMode: ThemeMode.light,
      navigatorKey: navigatorKey,
      onGenerateRoute: RouterModule.router().generateRoute,
    );
  }
}
