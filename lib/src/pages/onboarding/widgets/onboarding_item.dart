import 'package:flutter/widgets.dart';
import 'package:ui_theme/ui_theme.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem({
    super.key,
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
