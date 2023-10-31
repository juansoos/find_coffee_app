import 'package:find_coffee_app/src/pages/map/map_page.dart';
import 'package:find_coffee_app/src/pages/tools/tools_page.dart';
import 'package:flutter/material.dart';
import 'package:ui_theme/ui_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  final pages = [const MapPage(), const ToolsPage()];
  final items = [
    TabBarItem(
      selected: const MapIcon(),
      unselected: const MapIconOutlined(),
      label: "Map",
    ),
    TabBarItem(
      selected: const ToolsIcon(),
      unselected: const ToolsIconOutlined(),
      label: "Tools",
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
