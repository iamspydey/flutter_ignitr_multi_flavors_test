import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../shared/shared.dart';
import 'local_settings_service.dart';
import 'remote_settings_service.dart';

abstract class SettingsService extends BaseService {
  /// Define if this is in dev mode
  static bool devMode = Config.devMode;

  /// Create and get the instance of [SettingsService]
  static SettingsService get instance {
    InternetService internetService = InternetService.instance;

    if (!Get.isRegistered<SettingsService>()) {
      Get.lazyPut<SettingsService>(() {
        if (devMode) return LocalSettingsService();
        if (!internetService.isConnected) return LocalSettingsService();
        return RemoteSettingsService();
      });
    }

    return Get.find<SettingsService>();
  }

  /// Do Something
  Future<ApiResponse> doSomething();
}
