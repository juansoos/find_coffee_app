import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_theme/ui_theme.dart';

class CustomScaffold extends PlatformWidget<CupertinoPageScaffold, Scaffold> {
  const CustomScaffold({
    super.key,
    required this.child,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.bottomNavigationBar,
    this.appBarTitle,
  });

  final Widget child;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final Widget? bottomNavigationBar;
  final String? appBarTitle;

  @override
  Scaffold buildAndroidWidget(BuildContext context) {
    return Scaffold(
      appBar: appBarTitle != null
          ? AppBar(title: CustomText.appBar(text: appBarTitle!), elevation: 2)
          : null,
      body: child,
      floatingActionButtonLocation: floatingActionButtonLocation,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  @override
  CupertinoPageScaffold buildIosWidget(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: appBarTitle != null
          ? CupertinoNavigationBar(
              middle: CustomText.appBar(text: appBarTitle!),
              backgroundColor: CustomColors.brown,
            )
          : null,
      child: child,
    );
  }
}
