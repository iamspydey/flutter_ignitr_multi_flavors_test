import 'package:get/get.dart';

import '../../../../helpers/helpers.dart';
import '../../../models/models.dart';
import '../../../shared/shared.dart';
import '../services/article_service.dart';

class ArticleController extends AppController {
  /// Create and get the instance of the controller
  static ArticleController get instance {
    if (!Get.isRegistered<ArticleController>()) Get.put(ArticleController());
    return Get.find<ArticleController>();
  }

  /// Initialise [ArticleModule] service
  final ArticleService _articleService = ArticleService.instance;

  /// Props
  List<ArticleModel> articles = [];

  Future<void> index({bool refresh = false}) async {
    try {
      /// Start loading state
      if (!refresh) setBusy(true);

      /// Call the API
      ApiResponse response = await _articleService.index();

      /// Check if the response has error
      if (response.hasError()) {
        /// Show error message
        Toastr.error(message: "${response.message}");

        /// Stop loading state
        setBusy(false);
        return;
      }

      /// Set value to [articles]
      articles = List<ArticleModel>.from(response.data.map((x) => ArticleModel.fromJson(x)));

      /// Stop loading state
      setBusy(false);
    } catch (e) {
      print(e);
      Toastr.error(message: "Something went wrong.");
    }
  }

  Future<void> destroy({required int id}) async {
    try {
      /// Call the API
      ApiResponse response = await _articleService.destroy(id: id);

      /// Check if the response has error
      if (response.hasError()) {
        /// Show error message
        Toastr.error(message: "${response.message}");
        return;
      }

      /// Reload the data
      await index(refresh: true);
    } catch (e) {
      print(e);
      Toastr.error(message: "Something went wrong.");
    }
  }
}
