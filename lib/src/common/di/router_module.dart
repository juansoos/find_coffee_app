// ignore_for_file: avoid_classes_with_only_static_members

import 'package:find_coffee_app/src/common/di/modules_config.dart';
import 'package:find_coffee_app/src/config/router.dart';

abstract class RouterModule {
  static Router router() {
    final navigatorKey = FlutterModule.navigatorKey();

    return Router(navigatorKey);
  }
}
