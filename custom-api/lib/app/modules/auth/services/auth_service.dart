import 'package:get/get.dart';

import '../../../../config/config.dart';
import '../../../shared/shared.dart';
import 'remote_auth_service.dart';
import 'local_auth_service.dart';

abstract class AuthService extends BaseService {
  /// Define if this is in dev mode
  static bool devMode = Config.devMode;

  /// Create and get the instance of [AuthService]
  static AuthService get instance {
    InternetService internetService = InternetService.instance;

    if (!Get.isRegistered<AuthService>()) {
      Get.lazyPut<AuthService>(() {
        if (devMode) return LocalAuthService();
        if (!internetService.isConnected) return LocalAuthService();
        return RemoteAuthService();
      });
    }

    return Get.find<AuthService>();
  }

  /// Login the user
  Future<ApiResponse> login({required String client, required Map<String, dynamic> body});

  /// Registers user
  Future<ApiResponse> register({required String client, required Map<String, dynamic> body});

  /// Verifies OTP
  Future<ApiResponse> verifyOtp({required String client, required Map<String, dynamic> body});
}
