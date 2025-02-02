import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';
import '../config.dart';

// Input Border
OutlineInputBorder _inputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: kcSlate.shade700.withAlpha(alpha(0.3)),
      width: 1,
    ),
    borderRadius: BorderRadius.all(Radius.circular(4)),
  );
}

// Input Error Border
OutlineInputBorder _inputErrorBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: kcDanger.withAlpha(alpha(0.3)),
      width: 1,
    ),
    borderRadius: BorderRadius.all(Radius.circular(4)),
  );
}

// Input Theme
InputDecorationTheme _inputTheme() {
  return InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: kcWhite,
    labelStyle: TextStyle(
      color: kcSlate.shade500,
    ),
    hintStyle: TextStyle(
      height: 1,
      fontSize: 14,
      color: kcSlate.shade500.withAlpha(alpha(0.5)),
    ),
    contentPadding:
        const EdgeInsets.symmetric(vertical: kSpacer3, horizontal: kSpacer4),
    prefixStyle: TextStyle(
      color: kcSlate.shade500,
    ),
    border: _inputBorder(),
    enabledBorder: _inputBorder(),
    focusedBorder: _inputBorder(),
    errorBorder: _inputErrorBorder(),
  );
}

// Icon Theme
IconThemeData _iconTheme() => IconThemeData(
      color: kcSlate.shade500,
      size: 16.0,
    );

// Light Text Theme
TextTheme _textThemeLight() => TextTheme(
      displayLarge: TextStyle(
        fontSize: 35,
        fontFamily: Config.headingFontFamily,
        fontWeight: FontWeight.w600,
        color: AppColors.light.primaryContent,
      ),
      displayMedium: TextStyle(
        fontSize: 30,
        fontFamily: Config.headingFontFamily,
        fontWeight: FontWeight.w600,
        color: AppColors.light.primaryContent,
      ),
      displaySmall: TextStyle(
        fontSize: 25,
        fontFamily: Config.headingFontFamily,
        fontWeight: FontWeight.w600,
        color: AppColors.light.primaryContent,
      ),
      headlineMedium: TextStyle(
        fontFamily: Config.headingFontFamily,
        fontWeight: FontWeight.w600,
        color: AppColors.light.primaryContent,
      ),
      headlineSmall: TextStyle(
        fontFamily: Config.headingFontFamily,
        fontWeight: FontWeight.w600,
        color: AppColors.light.primaryContent,
      ),
      titleLarge: TextStyle(
        fontFamily: Config.headingFontFamily,
        fontWeight: FontWeight.w600,
        color: AppColors.light.primaryContent,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontFamily: Config.bodyFontFamily,
        color: AppColors.light.primaryContent,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontFamily: Config.bodyFontFamily,
        color: AppColors.light.primaryContent,
      ),
      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        fontFamily: Config.bodyFontFamily,
        color: AppColors.light.primaryContent,
      ),
    );

// Light Theme
final ThemeData lightThemeData = ThemeData(
  brightness: Brightness.light,
  iconTheme: _iconTheme(),
  textTheme: _textThemeLight(),
  scaffoldBackgroundColor: AppColors.light.primarySurface,
  colorScheme: ColorScheme.light(
    surface: AppColors.light.primarySurface,
    brightness: Brightness.light,
  ),
  primaryColor: AppColors.light.accent,
  primaryColorLight: AppColors.light.accent.withAlpha(alpha(0.8)),
  primarySwatch: generateMaterialColor(AppColors.light.accent),
  hintColor: AppColors.light.accent,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      backgroundColor: AppColors.light.accent,
    ),
  ),
  buttonTheme: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: AppColors.light.primarySurface,
    iconTheme: IconThemeData(color: AppColors.light.primaryContent, size: 24),
    toolbarTextStyle: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.light.primaryContent,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ).titleLarge,
    titleTextStyle: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.light.primaryContent,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ).titleLarge,
  ),
  inputDecorationTheme: _inputTheme(),
);
