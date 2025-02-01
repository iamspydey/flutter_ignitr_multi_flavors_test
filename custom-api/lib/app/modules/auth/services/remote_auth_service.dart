import '../../../shared/shared.dart';
import 'auth_service.dart';

class RemoteAuthService extends BaseService implements AuthService {
  @override
  Future<ApiResponse> login(
      {required String client, required Map<String, dynamic> body}) async {
    return await api.post('/login', client: client, body: body);
  }

  @override
  Future<ApiResponse> register(
      {required String client, required Map<String, dynamic> body}) async {
    return await api.post('/register', client: client, body: body);
  }

  @override
  Future<ApiResponse> verifyOtp(
      {required String client, required Map<String, dynamic> body}) {
    throw UnimplementedError();
  }
}
