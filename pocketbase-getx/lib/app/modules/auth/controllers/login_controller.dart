import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../../helpers/helpers.dart';
import '../../../shared/shared.dart';
import '../../modules.dart';

class LoginController extends AppController {
  static LoginController get instance {
    if (!Get.isRegistered<LoginController>()) Get.put(LoginController());
    return Get.find<LoginController>();
  }

  final AuthService _authService = AuthService.instance;

  /// Variables
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController identifierInput =
      TextEditingController(text: "shoaib.khan@devsbuddy.com");
  final TextEditingController passwordInput =
      TextEditingController(text: "password");

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;
    await attempt();
  }

  Future<void> attempt() async {
    try {
      /// Prepare form data to be sent to server
      Map<String, dynamic> body = {
        "email": identifierInput.text,
        "password": passwordInput.text,
      };

      /// Call api to login user
      ApiResponse response = await _authService.login(body: body);
      if (response.hasError()) {
        Toastr.show(message: "${response.message}");
        return;
      }
      print(response.data.toString());
      await auth.setUserData(response.data['record']);
      await auth.setUserToken(response.data['token']);

      Toastr.show(message: "${response.message}");

      /// Redirect user
      Get.offAllNamed(Config.homeRoute);
    } on Exception catch (e) {
      Get.to(() => ErrorPage(message: e.toString()));
    }
  }
}
