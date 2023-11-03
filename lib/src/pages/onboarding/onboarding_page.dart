import 'package:find_coffee_app/src/common/di/modules_config.dart';
import 'package:find_coffee_app/src/pages/onboarding/onboarding_view_model.dart';
import 'package:find_coffee_app/src/pages/onboarding/widgets/onboarding_widgets.dart';
import 'package:flutter/material.dart';
import 'package:ui_theme/ui_theme.dart';

final illustrations = ["a", "b", "c"];
final titles = ["Title 1", "Title 2", "Title 3"];
final descriptions = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
];

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final OnboardingViewModel _viewModel = OnboardingViewModel(
    RouterModule.router(),
    InteractorModule.checkOnboardingInteractor(),
  );

  final pageController = PageController();
  final selectedIndex = ValueNotifier(0);

  @override
  void dispose() {
    super.dispose();

    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  itemCount: illustrations.length,
                  itemBuilder: (context, index) {
                    return OnboardingItem(
                      illustration: illustrations[index],
                      title: titles[index],
                      description: descriptions[index],
                    );
                  },
                  onPageChanged: _onPageChanged,
                ),
              ),
              ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (_, index, __) {
                  return OnboardingDots(
                    position: index,
                    length: illustrations.length,
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (_, index, __) {
                  return OnboardingActions(
                    position: index,
                    length: illustrations.length,
                    onSkipAction: _onSkipActionClicked,
                    onNextAction: _onNextActionClicked,
                    onStartedAction: _viewModel.onGetStartedClicked,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _onPageChanged(int value) {
    selectedIndex.value = value;
  }

  void _onNextActionClicked() {
    final nextPage = selectedIndex.value + 1;

    pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _onSkipActionClicked() {
    pageController.jumpToPage(illustrations.length - 1);
  }
}
