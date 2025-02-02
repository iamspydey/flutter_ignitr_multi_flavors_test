import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../shared/shared.dart';
import 'remote_{SNAKE_MODULE}_service.dart';
import 'local_{SNAKE_MODULE}_service.dart';

abstract class {MODULE}Service extends BaseService {
  /// Define if this is in dev mode
  static bool useLocal = Config.devMode;

  /// Create and get the instance of [{MODULE}Service]
  static {MODULE}Service get instance {
    InternetService internetService = InternetService.instance;

    if (!Get.isRegistered<{MODULE}Service>()) {
      Get.lazyPut<{MODULE}Service>(() {
        if (useLocal) return Local{MODULE}Service();
        if (!internetService.isConnected) return Local{MODULE}Service();
        return Remote{MODULE}Service();
      });
    }

    return Get.find<{MODULE}Service>();
  }
  
  Future<ApiResponse> index();
  Future<ApiResponse> show({required int id});
  Future<ApiResponse> store({required Map<String, dynamic> data});
  Future<ApiResponse> patch({required int id, required Map<String, dynamic> data});
  Future<ApiResponse> destroy({required int id});
}
