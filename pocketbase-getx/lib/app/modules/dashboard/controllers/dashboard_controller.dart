import 'package:get/get.dart';

import '../../../../helpers/helpers.dart';
import '../../../shared/shared.dart';
import '../../modules.dart';

class DashboardController extends AppController {
  static DashboardController get instance {
    if (!Get.isRegistered<DashboardController>())
      Get.put(DashboardController());
    return Get.find<DashboardController>();
  }

  final DashboardService _dashboardService = DashboardService.instance;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    try {
      setBusy(true);
      ApiResponse response = await _dashboardService.getData();
      if (response.hasError()) {
        Toastr.error(message: "${response.message}");
        setBusy(false);
        return;
      }
      setBusy(false);
    } on Exception catch (e) {
      Get.to(() => ErrorPage(message: "${e.toString()}"));
    } on Error catch (e) {
      Get.to(() => ErrorPage(message: "${e.toString()}"));
    }
  }
}
