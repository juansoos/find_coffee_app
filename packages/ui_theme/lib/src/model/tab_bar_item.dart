import 'package:flutter/widgets.dart';

class TabBarItem {
  TabBarItem({
    required this.selected,
    required this.unselected,
    required this.label,
  });

  final Widget selected;
  final Widget unselected;
  final String label;
}
