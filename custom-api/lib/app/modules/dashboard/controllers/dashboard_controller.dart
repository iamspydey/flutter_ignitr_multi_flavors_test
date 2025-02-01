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
      String _client = 'dashboard-get-data';
      setBusy(true);
      _dashboardService.init(_client);
      ApiResponse response = await _dashboardService.getData(client: _client);
      if (response.hasError()) {
        Toastr.error(message: "${response.message}");
        _dashboardService.close(_client);
        setBusy(false);
        return;
      }
      print(response.data);
      setBusy(false);
      update();
      _dashboardService.close(_client);
    } on Exception catch (e) {
      Get.to(() => ErrorPage(message: "$e"));
    } on Error catch (e) {
      Get.to(() => ErrorPage(message: "$e"));
    }
  }
}
