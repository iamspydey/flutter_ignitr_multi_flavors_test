import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../shared/shared.dart';
import 'remote_article_service.dart';
import 'local_article_service.dart';

abstract class ArticleService extends BaseService {
  /// Define if this is in dev mode
  static bool useLocal = Config.devMode;

  /// Create and get the instance of [ArticleService]
  static ArticleService get instance {
    InternetService internetService = InternetService.instance;

    if (!Get.isRegistered<ArticleService>()) {
      Get.lazyPut<ArticleService>(() {
        if (useLocal) return LocalArticleService();
        if (!internetService.isConnected) return LocalArticleService();
        return RemoteArticleService();
      });
    }

    return Get.find<ArticleService>();
  }

  Future<ApiResponse> index();
  Future<ApiResponse> show({required int id});
  Future<ApiResponse> store({required Map<String, dynamic> data});
  Future<ApiResponse> patch(
      {required int id, required Map<String, dynamic> data});
  Future<ApiResponse> destroy({required int id});
}
