import 'package:flutter/material.dart';
import 'package:ui_theme/ui_theme.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      appBarTitle: "Tools",
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
