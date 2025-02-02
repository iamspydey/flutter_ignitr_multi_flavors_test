import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../helpers/helpers.dart';
import '../../../shared/shared.dart';
import '../../modules.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  final SettingsController controller = SettingsController.instance;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isBusy
          ? LoadingIconWidget(message: "Please wait...")
          : MasterLayout(
              title: "Settings",
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.all(kSpacer3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Theme",
                        style: TextStyl.bodySm(context),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () =>
                                  controller.changeTheme(context, "system"),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color:
                                          controller.selectedTheme == 'system'
                                              ? AppColors.accent(context)
                                              : Colors.transparent,
                                      width: 2),
                                ),
                                child: Column(
                                  children: [
                                    Icon(Icons.brightness_4_rounded, size: 32),
                                    Text(
                                      'System',
                                      style: TextStyl.bodySm(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: kSpacer2),
                          Expanded(
                            child: InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () =>
                                  controller.changeTheme(context, "light"),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: controller.selectedTheme == 'light'
                                          ? AppColors.accent(context)
                                          : Colors.transparent,
                                      width: 2),
                                ),
                                child: Column(
                                  children: [
                                    Icon(Icons.brightness_5_rounded, size: 32),
                                    Text(
                                      'Light',
                                      style: TextStyl.bodySm(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: kSpacer2),
                          Expanded(
                            child: InkWell(
                              splashFactory: NoSplash.splashFactory,
                              onTap: () =>
                                  controller.changeTheme(context, "dark"),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      color: controller.selectedTheme == 'dark'
                                          ? AppColors.accent(context)
                                          : Colors.transparent,
                                      width: 2),
                                ),
                                child: Column(
                                  children: [
                                    Icon(Icons.brightness_2_rounded, size: 32),
                                    Text(
                                      'Dark',
                                      style: TextStyl.bodySm(context),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: kSpacer),
                      Text(
                        "Account",
                        style: TextStyl.bodySm(context),
                      ),
                      const SizedBox(height: kSpacer1),
                      InkWell(
                        onTap: auth.logout,
                        splashFactory: NoSplash.splashFactory,
                        child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: AppColors.secondarySurface(context),
                            borderRadius: BorderRadius.circular(kSpacer2),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: kSpacer3, horizontal: kSpacer),
                          child: Text(
                            "Logout",
                            style: TextStyl.button(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
