import 'package:pocketbase/pocketbase.dart';

import '../../../shared/shared.dart';
import 'auth_service.dart';

class RemoteAuthService extends BaseService implements AuthService {
  @override
  Future<ApiResponse> login({required Map<String, dynamic> body}) async {
    RecordAuth record = await pocketBase.collection('users').authWithPassword(
          body['email'],
          body['password'],
        );
    print(record.record.toJson());
    return ApiResponse.success(data: record.toJson());
  }

  @override
  Future<ApiResponse> register({required Map<String, dynamic> body}) async {
    RecordModel record =
        await pocketBase.collection('users').create(body: body);
    return ApiResponse.success(data: record.toJson());
  }

  @override
  Future<ApiResponse> verifyOtp({required Map<String, dynamic> body}) {
    throw UnimplementedError();
  }
}
