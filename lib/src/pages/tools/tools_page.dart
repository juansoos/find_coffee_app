import 'package:find_coffee_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:ui_theme/ui_theme.dart';

class ToolsPage extends StatelessWidget {
  const ToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final i18n = I18n();

    return CustomScaffold(
      appBarTitle: i18n.tools,
      child: const SafeArea(
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
