import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../shared/shared.dart';
import '../../modules.dart';

class SplashController extends AppController {
  static SplashController get instance {
    if (!Get.isRegistered<SplashController>()) Get.put(SplashController());
    return Get.find<SplashController>();
  }

  final Auth auth = Auth.instance;

  @override
  void onInit() {
    super.onInit();
    redirectUser();
  }

  Future<void> redirectUser() async {
    if (Config.authRequired) {
      if (await auth.check()) {
        await 5.delay(() => Get.offAllNamed(Config.homeRoute));
      } else {
        await 5.delay(() => Get.offAllNamed(AuthRoutes.login));
      }
    } else {
      await 5.delay(() => Get.offAllNamed(Config.homeRoute));
    }
  }
}
