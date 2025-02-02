import 'package:get/get.dart';

import '../article_module.dart';

/// Defines the routes for the [Article] module.
/// This class contains the route paths and other route-related properties
/// that are used by the GetX routing system to manage the navigation
/// within the dashboard module.
class ArticleRoutes {
  static String get article => '/article';
}

/// Defines the routes for the [Article] module. This list of [GetPage] instances
/// specifies the routes and corresponding pages
/// in the [Article] module.
List<GetPage> articleRoutes = [
  GetPage(name: '/article', page: () => ArticlePage()),
];
