import '../../../../helpers/helpers.dart';
import '../../models/api_response.dart';
import '../services.dart';

class RemoteAuthSessionService extends BaseService
    implements AuthSessionService {
  @override
  Future<ApiResponse> getUser() async {
    if (storage.read("token") != null) {
      return await api.get('/profile', client: 'getUser', authenticate: true);
    } else {
      return ApiResponse(status: "0", message: "Something went wrong");
    }
  }

  @override
  Future<ApiResponse> logout() async {
    return await api.get('/logout', client: 'logout', authenticate: true);
  }
}
