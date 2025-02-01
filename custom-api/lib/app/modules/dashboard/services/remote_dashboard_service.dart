import '../../../shared/shared.dart';
import 'dashboard_service.dart';

class RemoteDashboardService extends BaseService implements DashboardService {
  @override
  Future<ApiResponse> getData({required String client}) async {
    return await api.get('/url', client: client);
  }
}
