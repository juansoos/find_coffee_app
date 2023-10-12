
import 'package:find_coffee_app/src/config/configuration.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  CustomTheme._();

  static TextTheme get _textTheme {
    // Reference to define values https://api.flutter.dev/flutter/material/TextTheme-class.html
    return const TextTheme(
      displayLarge: CustomTypography.display1,
      displayMedium: CustomTypography.display2,
      headlineLarge: CustomTypography.headline1,
      headlineMedium: CustomTypography.headline2,
      headlineSmall: CustomTypography.headline3,
      titleLarge: CustomTypography.title1,
      titleMedium: CustomTypography.title2,
      titleSmall: CustomTypography.title3,
      bodyLarge: CustomTypography.body1,
      bodyMedium: CustomTypography.body2,
      bodySmall: CustomTypography.body3,
    );
  }

  static ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(CustomColors.cream),
        minimumSize: MaterialStateProperty.all(const Size(100, 40)),
        textStyle: MaterialStateProperty.all(_textTheme.titleSmall),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return CustomColors.brown.withOpacity(0.5);
            }
            return CustomColors.brown;
          },
        ),
      ),
    );
  }

  static ThemeData light = ThemeData.from(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: CustomColors.primary,
      onPrimary: CustomColors.onPrimary,
      secondary: CustomColors.secondary,
      onSecondary: CustomColors.onSecondary,
      error: CustomColors.error,
      onError: CustomColors.error,
      background: CustomColors.background,
      onBackground: CustomColors.background,
      surface: CustomColors.primary,
      onSurface: CustomColors.primary,
    ),
    useMaterial3: true,
  ).copyWith(
    textTheme: _textTheme,
    elevatedButtonTheme: _elevatedButtonTheme,
  );
}
