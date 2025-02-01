import 'package:pocketbase/pocketbase.dart';

import '../../models/api_response.dart';
import '../services.dart';

class RemoteAuthSessionService extends BaseService implements AuthSessionService {
  @override
  Future<ApiResponse> refreshAuth({required String token}) async {
    RecordAuth? record = await pocketBase.collection('users').authRefresh(headers: {
      'Authorization': 'Bearer $token',
    });
    return ApiResponse.success(data: record.toJson());
  }

  @override
  Future<ApiResponse> logout() async {
    pocketBase.authStore.clear();
    return ApiResponse.success(message: "Logout Successfully");
  }
}
