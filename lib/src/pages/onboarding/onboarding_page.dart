import 'package:find_coffee_app/generated/l10n.dart';
import 'package:find_coffee_app/src/common/di/modules_config.dart';
import 'package:find_coffee_app/src/config/configuration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_theme/ui_theme.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final i18n = I18n();

    return CustomScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText.display2(text: "Onboarding page"),
              const SizedBox(height: 20),
              CustomButton(
                text: i18n.start,
                onPressed: () => RouterModule.router().replaceTo(HomeRoute()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
