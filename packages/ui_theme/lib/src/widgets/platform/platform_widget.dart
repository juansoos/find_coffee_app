import 'package:flutter/cupertino.dart';
import 'package:ui_theme/src/utils/platform_utils.dart';

abstract class PlatformWidget<IOS extends Widget, ANDROID extends Widget>
    extends StatelessWidget {
  const PlatformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<PlatformType, Widget> buildByPlatform = {
      PlatformType.android: buildAndroidWidget(context),
      PlatformType.ios: buildIosWidget(context),
    };

    return buildByPlatform[platform] ?? buildAndroidWidget(context);
  }

  ANDROID buildAndroidWidget(BuildContext context);

  IOS buildIosWidget(BuildContext context);
}
