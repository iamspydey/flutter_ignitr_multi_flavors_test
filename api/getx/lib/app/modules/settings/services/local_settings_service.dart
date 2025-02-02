import '../../../shared/shared.dart';
import 'settings_service.dart';

class LocalSettingsService extends BaseService implements SettingsService {
  @override
  String? database = 'settings';

  @override
  Future<ApiResponse> doSomething() async {
    throw UnimplementedError();
  }
}
