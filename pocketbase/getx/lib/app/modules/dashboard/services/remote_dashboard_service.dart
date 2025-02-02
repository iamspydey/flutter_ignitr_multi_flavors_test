import '../../../shared/shared.dart';
import 'dashboard_service.dart';

class RemoteDashboardService extends BaseService implements DashboardService {
  @override
  Future<ApiResponse> getData() async {
    return ApiResponse.success(data: {"Test Data": "Test Data"});
  }
}
