import 'package:flutter/material.dart';
import 'package:ui_theme/ui_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  final pages = [const Placeholder(), const Placeholder()];
  final items = [
    TabBarItem(
      selected: const HomeIcon(),
      unselected: const HomeIconOutlined(),
      label: "Home",
    ),
    TabBarItem(
      selected: const ProfileIcon(),
      unselected: const ProfileIconOutlined(),
      label: "Profile",
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomTabScaffold(
      pages: pages,
      items: items,
      position: currentPageIndex,
      onItemTapped: onItemTapped,
    );
  }
}
