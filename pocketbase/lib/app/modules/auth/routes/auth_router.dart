import 'package:get/get.dart';

import '../auth_module.dart';

/// Defines the routes for the authentication module.
class AuthRoutes {
  static String get login => '/login';
  static String get register => '/register';
}

/// Defines the routes for the authentication module. This list of [GetPage] instances
/// specifies the routes and corresponding page widgets for the login and register
/// functionality in the authentication module.
List<GetPage> authRoutes = [
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/register', page: () => RegisterPage()),
];
