import 'package:flutter/widgets.dart';
import 'package:ui_theme/ui_theme.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.style,
    this.color,
  });

  const CustomText.appBar({
    super.key,
    required this.text,
    this.style = CustomTypography.title1,
    this.color = CustomColors.white,
  });

  const CustomText.display2({
    super.key,
    required this.text,
    this.style = CustomTypography.display2,
    this.color,
  });

  const CustomText.headline3({
    super.key,
    required this.text,
    this.style = CustomTypography.headline3,
    this.color,
  });

  const CustomText.title3({
    super.key,
    required this.text,
    this.style = CustomTypography.title3,
    this.color = CustomColors.white,
  });

  const CustomText.body2({
    super.key,
    required this.text,
    this.style = CustomTypography.body2,
    this.color,
  });

  final String text;
  final TextStyle style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(color: color),
      textAlign: TextAlign.center,
    );
  }
}
