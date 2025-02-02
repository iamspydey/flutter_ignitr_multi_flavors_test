import 'package:get/get.dart';

import '../dashboard_module.dart';

/// Defines the routes for the dashboard module.
/// This class contains the route paths and other route-related properties
/// that are used by the GetX routing system to manage the navigation
/// within the dashboard module.
class DashboardRoutes {
  static String get dashboard => '/dashboard';
}

/// The list of routes for the dashboard module.
/// This list is used by the GetX routing system to define the available routes
/// for the dashboard module.
List<GetPage> dashboardRoutes = [
  GetPage(name: '/dashboard', page: () => DashboardPage()),
];
