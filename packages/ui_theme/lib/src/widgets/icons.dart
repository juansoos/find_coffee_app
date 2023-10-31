import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_theme/src/widgets/platform/platform_widget.dart';

class MapIcon extends PlatformWidget<Icon, Icon> {
  const MapIcon({super.key});

  @override
  Icon buildAndroidWidget(BuildContext context) {
    return const Icon(Icons.map);
  }

  @override
  Icon buildIosWidget(BuildContext context) {
    return const Icon(CupertinoIcons.map_fill);
  }
}

class MapIconOutlined extends PlatformWidget<Icon, Icon> {
  const MapIconOutlined({super.key});

  @override
  Icon buildAndroidWidget(BuildContext context) {
    return const Icon(Icons.map_outlined);
  }

  @override
  Icon buildIosWidget(BuildContext context) {
    return const Icon(CupertinoIcons.map);
  }
}

class ToolsIcon extends PlatformWidget<Icon, Icon> {
  const ToolsIcon({super.key});

  @override
  Icon buildAndroidWidget(BuildContext context) {
    return const Icon(Icons.settings);
  }

  @override
  Icon buildIosWidget(BuildContext context) {
    return const Icon(CupertinoIcons.gear_alt_fill);
  }
}

class ToolsIconOutlined extends PlatformWidget<Icon, Icon> {
  const ToolsIconOutlined({super.key});

  @override
  Icon buildAndroidWidget(BuildContext context) {
    return const Icon(Icons.settings_outlined);
  }

  @override
  Icon buildIosWidget(BuildContext context) {
    return const Icon(CupertinoIcons.gear);
  }
}
