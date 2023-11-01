import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_theme/ui_theme.dart';

class CustomButtonFilled
    extends PlatformWidget<CupertinoButton, ElevatedButton> {
  const CustomButtonFilled({
    super.key,
    required this.text,
    this.onPressed,
  });

  final String text;
  final void Function()? onPressed;

  @override
  ElevatedButton buildAndroidWidget(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: CustomText.title3(text: text),
    );
  }

  @override
  CupertinoButton buildIosWidget(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: onPressed,
      child: CustomText.title3(text: text),
    );
  }
}

class CustomButton extends PlatformWidget<CupertinoButton, TextButton> {
  const CustomButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  TextButton buildAndroidWidget(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: CustomText.title3(
        text: text,
        color: CustomColors.brown,
      ),
    );
  }

  @override
  CupertinoButton buildIosWidget(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: CustomText.title3(
        text: text,
        color: CustomColors.brown,
      ),
    );
  }
}
