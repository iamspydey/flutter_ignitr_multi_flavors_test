import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/helpers.dart';
import '../../../shared/shared.dart';
import '../../modules.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});
  final DashboardController controller = DashboardController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isBusy
          ? LoadingIconWidget(message: "Please wait...")
          : MasterLayout(
              title: "Dashboard",
              actions: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Get.toNamed(SettingsRoutes.settings),
                ),
              ],
              body: Padding(
                padding: EdgeInsets.all(0.0),
                child: Center(
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Dashboard Page',
                          style: TextStyl.subtitle(context),
                        ),
                        SizedBox(height: kSpacer),
                        Text(
                          auth.user.name ?? 'No user',
                          style: TextStyl.body(context),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
