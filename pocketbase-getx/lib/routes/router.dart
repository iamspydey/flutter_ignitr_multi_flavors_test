import 'package:get/get.dart';

import '../app/modules/modules.dart';

/// Defines the application's routing configuration.
/// This class contains static properties and methods that define the routes used in the application.
class Routes {
  static String get splash => '/splash';
}

List<GetPage> routes = [
  /// Basic Routes
  ...splashRoutes,

  /// Auth Routes
  ...authRoutes,

  /// Dashboard Routes
  ...dashboardRoutes,

  /// Setting Routes
  ...settingsRoutes,

  /// Article Routes
  ...articleRoutes,

  //%EDIT_CODE_ABOVE_THIS_LINE_AND_DONT_REMOVE_THIS_LINE%//
];
