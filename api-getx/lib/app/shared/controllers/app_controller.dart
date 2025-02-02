import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../helpers/helpers.dart';
import '../shared.dart';

class AppController extends GetxController {
  ScrollController scrollController = ScrollController(keepScrollOffset: false);

  /// Get instance of [InternetService]
  InternetService internetService = InternetService.instance;

  /// Observables
  RxBool setSticky = false.obs;
  RxBool _isBusy = false.obs;

  /// Getters
  bool get isSticky => setSticky.value;

  bool get isBusy => _isBusy.value;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      onScroll();
    });
  }

  void onScroll() {
    if (scrollController.positions.last.pixels >= 72) {
      setSticky(true);
    } else {
      setSticky(false);
    }
  }

  /// Set the busy state
  void setBusy(bool val) {
    _isBusy(val);
    update();
  }

  void showBusy() {
    Get.dialog(
      Dialog(
        child: Container(
          decoration: BoxDecoration(
            color: kcWhite,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/icons/loader-circular.gif',
                height: 40,
              ),
              const SizedBox(height: 16),
              Text(
                'Please wait...',
                style: TextStyl.body(Get.context!),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  void hideBusy() {
    if (Get.isDialogOpen!) Get.back();
  }

  static void quit() {
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
