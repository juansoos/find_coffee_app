import 'package:find_coffee_app/generated/l10n.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_theme/ui_theme.dart';

class OnboardingActions extends StatelessWidget {
  const OnboardingActions({
    super.key,
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
