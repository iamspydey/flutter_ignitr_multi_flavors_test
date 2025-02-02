import 'package:google_fonts/google_fonts.dart';

// Expport configs
export 'http_client/app_http_overrides.dart';
export 'theme/app_theme.dart';
export 'theme/light_theme.dart';
export 'theme/dark_theme.dart';
export 'theme/colors.dart';
export 'theme/color_palette.dart';
// Export END

import '../app/modules/modules.dart';

class Config {
  /// Define the [devMode] for development
  static bool devMode = true;

  /// Is Auth Required In App
  static bool authRequired = true;

  /// API base url
  static String apiBaseUrl = "https://jsonplaceholder.typicode.com";

  /// App Name
  static String appName = "Ignitr";

  /// Home/Dashboard URL [To be used to redirect user after login]
  static String homeRoute = DashboardRoutes.dashboard;

  /// Font Family For The Headings And Titles
  static String? headingFontFamily = GoogleFonts.poppins().fontFamily;

  /// Font Family For The Body Text
  static String? bodyFontFamily = GoogleFonts.inter().fontFamily;
}
