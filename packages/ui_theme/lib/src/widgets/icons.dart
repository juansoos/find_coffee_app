import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_theme/src/widgets/platform/platform_widget.dart';

class HomeIcon extends PlatformWidget<Icon, Icon> {
  const HomeIcon({super.key});

  @override
  Icon buildAndroidWidget(BuildContext context) {
    return const Icon(Icons.home);
  }

  @override
  Icon buildIosWidget(BuildContext context) {
    return const Icon(CupertinoIcons.house_fill);
  }
}

class HomeIconOutlined extends PlatformWidget<Icon, Icon> {
  const HomeIconOutlined({super.key});

  @override
  Icon buildAndroidWidget(BuildContext context) {
    return const Icon(Icons.home_outlined);
  }

  @override
  Icon buildIosWidget(BuildContext context) {
    return const Icon(CupertinoIcons.house);
  }
}

class ProfileIcon extends PlatformWidget<Icon, Icon> {
  const ProfileIcon({super.key});

  @override
  Icon buildAndroidWidget(BuildContext context) {
    return const Icon(Icons.person);
  }

  @override
  Icon buildIosWidget(BuildContext context) {
    return const Icon(CupertinoIcons.person_fill);
  }
}

class ProfileIconOutlined extends PlatformWidget<Icon, Icon> {
  const ProfileIconOutlined({super.key});

  @override
  Icon buildAndroidWidget(BuildContext context) {
    return const Icon(Icons.person_outlined);
  }

  @override
  Icon buildIosWidget(BuildContext context) {
    return const Icon(CupertinoIcons.person);
  }
}
