import '../../../shared/models/api_response.dart';
import '../../../shared/services/services.dart';
import 'dashboard_service.dart';

class LocalDashboardService extends BaseService implements DashboardService {
  @override
  String? database = 'dashboard';

  @override
  Future<ApiResponse> getData() async {
    return ApiResponse.success(data: "Test Data");
  }
}
