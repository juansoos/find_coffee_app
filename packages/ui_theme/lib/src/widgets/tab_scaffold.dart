import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_theme/ui_theme.dart';

class CustomTabScaffold extends PlatformWidget<CupertinoTabScaffold, Scaffold> {
  const CustomTabScaffold({
    super.key,
    required this.pages,
    required this.items,
    required this.position,
    required this.onItemTapped,
  });

  final List<TabBarItem> items;
  final List<Widget> pages;

  final int position;
  final Function(int) onItemTapped;

  @override
  Scaffold buildAndroidWidget(BuildContext context) {
    return Scaffold(
      body: pages[position],
      bottomNavigationBar: NavigationBar(
        selectedIndex: position,
        onDestinationSelected: onItemTapped,
        destinations: items.map((item) {
          return NavigationDestination(
            selectedIcon: item.selected,
            icon: item.unselected,
            label: item.label,
          );
        }).toList(),
      ),
    );
  }

  @override
  CupertinoTabScaffold buildIosWidget(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CustomColors.cream,
        activeColor: CustomColors.brown,
        inactiveColor: CustomColors.lightBrown,
        items: items.map((item) {
          return BottomNavigationBarItem(
            activeIcon: item.selected,
            icon: item.unselected,
            label: item.label,
          );
        }).toList(),
      ),
      tabBuilder: (BuildContext context, int index) {
        return pages[index];
      },
    );
  }
}
