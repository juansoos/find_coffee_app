import 'package:find_coffee_app/generated/l10n.dart';
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

  @override
  Widget build(BuildContext context) {
    final i18n = I18n();

    final items = [
      TabBarItem(
        selected: const MapIcon(),
        unselected: const MapIconOutlined(),
        label: i18n.map,
      ),
      TabBarItem(
        selected: const ToolsIcon(),
        unselected: const ToolsIconOutlined(),
        label: i18n.tools,
      ),
    ];

    return CustomTabScaffold(
      pages: const [MapPage(), ToolsPage()],
      items: items,
      position: currentPageIndex,
      onItemTapped: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }
}
