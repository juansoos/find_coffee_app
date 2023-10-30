import 'package:flutter/cupertino.dart';

class BottomNavigationIconOptions {
  BottomNavigationIconOptions({
    required this.selected,
    required this.unselected,
  });

  final Icon selected;
  final Icon unselected;
}
