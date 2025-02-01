import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../shared/models/api_response.dart';
import '../../../shared/services/services.dart';
import 'local_dashboard_service.dart';
import 'remote_dashboard_service.dart';

abstract class DashboardService extends BaseService {
  /// Define if this is in dev mode
  static bool devMode = Config.devMode;

  /// Create and get the instance of [DashboardService]
  static DashboardService get instance {
    InternetService internetService = InternetService.instance;

    if (!Get.isRegistered<DashboardService>()) {
      Get.lazyPut<DashboardService>(() {
        if (devMode) return LocalDashboardService();
        if (!internetService.isConnected) return LocalDashboardService();
        return RemoteDashboardService();
      });
    }

    return Get.find<DashboardService>();
  }

  /// Do Something
  Future<ApiResponse> getData({required String client});
}
