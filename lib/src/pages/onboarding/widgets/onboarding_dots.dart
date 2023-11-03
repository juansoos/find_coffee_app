import 'package:flutter/widgets.dart';
import 'package:ui_theme/ui_theme.dart';

class OnboardingDots extends StatelessWidget {
  const OnboardingDots({
    super.key,
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
        children: List.generate(length, (indexIndicator) {
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
        }),
      ),
    );
  }
}
