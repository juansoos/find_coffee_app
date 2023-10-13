import 'package:find_coffee_app/src/common/di/modules_config.dart';
import 'package:find_coffee_app/src/config/configuration.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 32, left: 24, right: 24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Content here!', style: CustomTypography.display2)
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: ElevatedButton(
          onPressed: () => RouterModule.router().replaceTo(HomeRoute()),
          style: ElevatedButton.styleFrom(minimumSize: const Size(120, 50)),
          child: const Text("Start"),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
