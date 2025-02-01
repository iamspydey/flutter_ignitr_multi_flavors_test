import 'package:get/get.dart';

import '../../../shared/shared.dart';
import 'remote_auth_service.dart';
import 'local_auth_service.dart';

abstract class AuthService extends BaseService {
  /// Define if this is in dev mode
  static bool devMode = false;

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
  Future<ApiResponse> login({required Map<String, dynamic> body});

  /// Registers user
  Future<ApiResponse> register({required Map<String, dynamic> body});

  /// Verifies OTP
  Future<ApiResponse> verifyOtp({required Map<String, dynamic> body});
}
