import 'package:get/get.dart';

import '../splash_module.dart';

/// Defines the routes for the Splash module.
class SplashRoutes {
  static String get splash => '/splash';
}

/// Defines the routes for the Splash module.
/// This list of [GetPage] instances configures the routes
/// that are available for the Splash module.
List<GetPage> splashRoutes = [
  GetPage(name: '/splash', page: () => SplashPage()),
];
