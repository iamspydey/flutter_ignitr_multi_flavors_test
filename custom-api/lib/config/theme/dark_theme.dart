import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';
import '../config.dart';

/// Input Border
OutlineInputBorder _inputBorder([Color? color]) {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: color != null ? color : kcSlate.shade100.withAlpha(alpha(0.3)),
      width: 1,
    ),
    borderRadius: BorderRadius.all(Radius.circular(4)),
  );
}

/// Input Theme
InputDecorationTheme _inputTheme() {
  return InputDecorationTheme(
    isDense: true,
    labelStyle: TextStyle(
      color: kcSlate.shade100,
    ),
    hintStyle: TextStyle(
      height: 1,
      fontSize: 14,
      color: kcSlate.shade100.withAlpha(alpha(0.5)),
    ),
    contentPadding:
        const EdgeInsets.symmetric(vertical: kSpacer3, horizontal: kSpacer4),
    border: _inputBorder(),
    enabledBorder: _inputBorder(),
    focusedBorder: _inputBorder(),
    errorBorder: _inputBorder(kcDanger),
  );
}

/// Icon Theme
IconThemeData _iconTheme = IconThemeData(
  color: kcSlate.shade100,
  size: 16.0,
);

/// Dark Text Theme
TextTheme _textThemeDark = TextTheme(
  displayLarge: TextStyle(
    fontSize: 30,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcWhite,
  ),
  displayMedium: TextStyle(
    fontSize: 25,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcWhite,
  ),
  displaySmall: TextStyle(
    fontSize: 20,
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcWhite,
  ),
  headlineMedium: TextStyle(
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcWhite,
  ),
  headlineSmall: TextStyle(
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcWhite,
  ),
  titleLarge: TextStyle(
    fontFamily: Config.headingFontFamily,
    fontWeight: FontWeight.w600,
    color: kcWhite,
  ),
  bodyLarge: TextStyle(
    fontSize: 16.0,
    fontFamily: Config.bodyFontFamily,
    color: kcSlate.shade100,
  ),
  bodyMedium: TextStyle(
    fontSize: 14.0,
    fontFamily: Config.bodyFontFamily,
    color: kcSlate.shade100,
  ),
  labelLarge: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
    fontFamily: Config.bodyFontFamily,
    color: kcSlate.shade100,
  ),
);

/// Dark Theme
final ThemeData darkThemeData = ThemeData(
  brightness: Brightness.dark,
  iconTheme: _iconTheme,
  textTheme: _textThemeDark,
  scaffoldBackgroundColor: AppColors.dark.primarySurface,
  colorScheme: ColorScheme.dark(
    surface: AppColors.dark.primarySurface,
    brightness: Brightness.dark,
  ),
  primaryColor: AppColors.dark.accent,
  primaryColorLight: AppColors.dark.accent.withAlpha(alpha(0.875)),
  hintColor: AppColors.dark.accent,
  primarySwatch: generateMaterialColor(AppColors.dark.accent),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      backgroundColor: AppColors.dark.accent,
    ),
  ),
  buttonTheme: ButtonThemeData(
    padding: EdgeInsets.symmetric(horizontal: 20.0),
  ),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    backgroundColor: AppColors.dark.primarySurface,
    iconTheme: IconThemeData(color: kcSlate.shade100, size: 24),
    toolbarTextStyle: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.dark.primaryContent,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ).titleLarge,
    titleTextStyle: TextTheme(
      titleLarge: TextStyle(
        color: AppColors.dark.primaryContent,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ).titleLarge,
  ),
  inputDecorationTheme: _inputTheme(),
);
