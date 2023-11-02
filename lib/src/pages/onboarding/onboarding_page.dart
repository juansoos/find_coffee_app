import 'package:find_coffee_app/generated/l10n.dart';
import 'package:find_coffee_app/src/common/di/modules_config.dart';
import 'package:find_coffee_app/src/pages/onboarding/onboarding_view_model.dart';
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
                    return _OnboardingItem(
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
                  return _OnboardingDots(
                    position: index,
                    length: illustrations.length,
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: selectedIndex,
                builder: (_, index, __) {
                  return _OnboardingActions(
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

class _OnboardingItem extends StatelessWidget {
  const _OnboardingItem({
    required this.illustration,
    required this.title,
    required this.description,
  });

  final String illustration;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.5,
            width: size.width,
            child: const Placeholder(),
          ),
          const SizedBox(height: 16),
          CustomText.headline3(text: title),
          const SizedBox(height: 16),
          CustomText.body2(text: description),
        ],
      ),
    );
  }
}

class _OnboardingDots extends StatelessWidget {
  const _OnboardingDots({
    required this.position,
    required this.length,
  });

  final int position;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 32),
      child: Wrap(
        spacing: 8,
        children: List.generate(
          length,
          (indexIndicator) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 8,
              width: indexIndicator == position ? 24 : 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: indexIndicator == position
                    ? CustomColors.brown
                    : CustomColors.brown.withOpacity(0.5),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _OnboardingActions extends StatelessWidget {
  const _OnboardingActions({
    required this.position,
    required this.length,
    required this.onSkipAction,
    required this.onNextAction,
    required this.onStartedAction,
  });

  final int position;
  final int length;

  final void Function() onSkipAction;
  final void Function() onNextAction;
  final void Function() onStartedAction;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final i18n = I18n();

    if (position == length - 1) {
      return SizedBox(
        width: size.width,
        height: 48,
        child: CustomButtonFilled(
          text: i18n.getStarted,
          onPressed: onStartedAction,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(onPressed: onSkipAction, text: i18n.skip),
        CustomButtonFilled(onPressed: onNextAction, text: i18n.next)
      ],
    );
  }
}
