import 'dart:async';

import 'package:find_coffee_app/src/common/di/modules_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';
import 'package:ui_theme/ui_theme.dart';

void main() {
  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    final navigatorKey = FlutterModule.navigatorKey();
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
    return PlatformApp(
      title: 'Find Coffee',
      navigatorKey: navigatorKey,
      onGenerateRoute: RouterModule.router().generateRoute,
    );
  }
}
