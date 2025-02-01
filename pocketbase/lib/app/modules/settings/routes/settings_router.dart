import 'package:get/get.dart';

import '../settings_module.dart';

/// Defines the routes for the Settings module.
class SettingsRoutes {
  static String get settings => '/settings';
}

/// Defines the routes for the Settings module.
/// This list of [GetPage] instances configures the routing for the Settings module,
/// including the route for the '/settings' path which maps to the SettingsPage.
List<GetPage> settingsRoutes = [
  GetPage(name: '/settings', page: () => SettingsPage()),
];
